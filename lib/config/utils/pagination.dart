import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationModel<T> {
  final int totalPages;
  final int currentPage;
  final int totalRecords;
  final List<T> items;

  PaginationModel({
    required this.totalPages,
    required this.currentPage,
    required this.totalRecords,
    required this.items,
  });
}

class Pagination<T> extends GetxController {
  final RxList<T> items = <T>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isFetching = false.obs;
  final RxInt currentPage = 1.obs;
  final RxInt totalPages = 1.obs;
  final RxInt totalRecords = 0.obs;

  // ✅ Controller created only once
  final ScrollController scrollController = ScrollController();
  double _offset = 300;

  Future<PaginationModel<T>?> Function()? _onInitialLoad;
  Future<PaginationModel<T>?> Function(int nextPage)? _onFetch;

  bool get hasMore => currentPage.value < totalPages.value;
  List<T> get list => List.unmodifiable(items);

  Pagination() {
    _initScrollListener();
  }

  // ✅ Safe attach (prevents duplicate listener errors)
  void _initScrollListener() {
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - _offset) {
        _fetchNextSafe();
      }
    });
  }

  static Future<Pagination<T>> listener<T>({
    required Pagination<T> controller,
    double offset = 300,
    required Future<PaginationModel<T>?> Function() onInitialLoad,
    required Future<PaginationModel<T>?> Function(int nextPage) onFetch,
  }) async {
    controller._offset = offset;
    controller._onInitialLoad = onInitialLoad;
    controller._onFetch = onFetch;

    // ⚡ Ensure controller listener is attached only once
    // ignore: invalid_use_of_protected_member
    if (!controller.scrollController.hasListeners) {
      controller._initScrollListener();
    }

    await controller._loadInitial();
    return controller;
  }

  Future<void> reload() async {
    items.clear();
    currentPage.value = 1;
    totalPages.value = 1;
    totalRecords.value = 0;
    await _loadInitial();
  }

  Future<void> _fetchNextSafe() async {
    if (isFetching.value || !hasMore) return;
    await _fetchNext();
  }

  Future<void> _loadInitial() async {
    if (_onInitialLoad == null) return;
    isLoading.value = true;
    await Future.delayed(Duration.zero);

    try {
      final model = await _onInitialLoad!();
      if (model != null) _applyModel(model);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _fetchNext() async {
    if (_onFetch == null) return;
    isFetching.value = true;
    await Future.delayed(Duration.zero);

    try {
      final model = await _onFetch!(currentPage.value + 1);
      if (model != null) _applyModel(model, append: true);
    } finally {
      isFetching.value = false;
    }
  }

  void _applyModel(PaginationModel<T> model, {bool append = false}) {
    totalPages.value = model.totalPages;
    currentPage.value = model.currentPage;
    totalRecords.value = model.totalRecords;

    if (append) {
      items.addAll(model.items);
    } else {
      items.assignAll(model.items);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
