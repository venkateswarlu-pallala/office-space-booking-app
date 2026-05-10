// import 'dart:convert';
//
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../../config/repo/api_sheet.dart';
// import '../model/home_model.dart';
//
// class HomeController extends GetxController {
//   final RxBool loading = true.obs;
//
//   // ✅ MODEL LIST
//   final RxList<CarouselModel> carouselList = <CarouselModel>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCarousel();
//   }
//
//   Future<void> fetchCarousel() async {
//     try {
//       loading.value = true;
//
//       final response = await http.get(ApiSheet.home.homeData);
//       final res = jsonDecode(response.body);
//
//       if (res['success'] == true) {
//         final List list =
//             res['carousel'] ?? res['data']?['carousel'] ?? [];
//
//         carouselList.assignAll(
//           list.map((e) => CarouselModel.fromJson(e)).toList(),
//         );
//       }
//     } catch (e) {
//       print(e);
//     } finally {
//       loading.value = false;
//     }
//   }
// }
