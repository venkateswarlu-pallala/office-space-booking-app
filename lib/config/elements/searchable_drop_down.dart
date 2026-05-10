import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_drop_down.dart';



class SearchableDropdown<T> extends StatefulWidget {
  final List<T> items;
  final DropDownValue<T>? value;
  final String hint;
  final String searchHint;
  final ValueChanged<T?> onChanged;
  final ValueChanged<String>? onSearch;
  final int? debounce;

  /// NEW: Custom widget builder for dropdown items
  final Widget Function(T item)? itemBuilder;

  const SearchableDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.onSearch,
    this.debounce,
    this.hint = "Select",
    this.searchHint = "Search...",
    this.itemBuilder,
  });

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  final TextEditingController _searchCtrl = TextEditingController();
  Timer? _debounceTimer;

  bool get isOpen => _overlayEntry != null;

  @override
  void dispose() {
    _searchCtrl.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  // INTERNAL CLOSE (DO NOT reset search)
  void _closeOverlayWithoutReset() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }

  // USER CLOSE (reset search)
  void closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;

    _debounceTimer?.cancel();
    _searchCtrl.clear();
    widget.onSearch?.call("");

    setState(() {});
  }

  void openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {});
  }

  // ============================================================
  // Debounce search logic
  // ============================================================
  void _triggerSearch(String value) {
    if (widget.onSearch == null) return;

    // Search on Enter mode
    if (widget.debounce == null) return;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(milliseconds: widget.debounce!), () {
      widget.onSearch!(value);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!isOpen) return;
        _closeOverlayWithoutReset();
        openDropdown();
      });
    });
  }

  // ============================================================
  // Search on Enter (only when debounce == null)
  // ============================================================
  void _searchOnEnter(KeyEvent event) {
    if (widget.debounce != null) return;

    if (event is KeyUpEvent &&
        event.logicalKey == LogicalKeyboardKey.enter) {
      widget.onSearch?.call(_searchCtrl.text);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!isOpen) return;
        _closeOverlayWithoutReset();
        openDropdown();
      });
    }
  }

  // ============================================================
  // Overlay Dropdown Builder
  // ============================================================
  OverlayEntry _createOverlayEntry() {
    RenderBox box = context.findRenderObject() as RenderBox;
    final size = box.size;
    final pos = box.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Tap outside to close
            Positioned.fill(
              child: GestureDetector(
                onTap: closeDropdown,
                behavior: HitTestBehavior.translucent,
              ),
            ),

            Positioned(
              left: pos.dx,
              top: pos.dy + size.height + 6,
              width: size.width,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(maxHeight: 220),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.deepPurple),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: widget.items.map((item) {
                        return InkWell(
                          onTap: () {
                            widget.onChanged(item);
                            closeDropdown();
                          },

                          /// If custom builder provided → use it
                          /// else → default text row
                          child: widget.itemBuilder != null
                              ? widget.itemBuilder!(item)
                              : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: Text(item.toString()),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // UI
  // ============================================================
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepPurple),
        ),

        child: isOpen
            ? Row(
          children: [
            const Icon(Icons.search, color: Colors.deepPurple),
            const SizedBox(width: 8),

            Expanded(
              child: Focus(
                onKeyEvent: (n, e) {
                  _searchOnEnter(e);
                  return KeyEventResult.ignored;
                },
                child: TextField(
                  controller: _searchCtrl,
                  autofocus: true,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(height: 1.1),
                  onChanged: _triggerSearch,
                ),
              ),
            ),

            GestureDetector(
              onTap: closeDropdown,
              child:
              const Icon(Icons.close, color: Colors.deepPurple),
            ),
          ],
        )
            : GestureDetector(
          onTap: openDropdown,
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.deepPurple),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.value?.label?.toString() ?? widget.hint,
                  style: TextStyle(
                    color: widget.value == null
                        ? Colors.grey
                        : Colors.black,
                  ),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}