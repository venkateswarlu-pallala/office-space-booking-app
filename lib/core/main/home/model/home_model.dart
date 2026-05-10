//
//
//
// class CarouselModel {
//   final String image;
//   final String redirect;
//
//   const CarouselModel({
//     required this.image,
//     required this.redirect,
//
//
//   factory CarouselModel.initial() {
//     return const CarouselModel(
//       image: '',
//       redirect: '',
//     );
//   }
//
//   factory CarouselModel.fromJson(Map<String, dynamic> json) {
//     return CarouselModel(
//       image: json['image']?.toString() ?? '',
//       redirect: json['redirect']?.toString() ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//       'redirect': redirect,
//     };
//   }
//
//   static List<CarouselModel> fromJsonList(dynamic json) {
//     final List<CarouselModel> items = [];
//
//     try {
//       if (json is List) {
//         for (final element in json) {
//           if (element is Map<String, dynamic>) {
//             items.add(CarouselModel.fromJson(element));
//           }
//         }
//       }
//     } catch (_) {}
//
//     return items;
//   }
// }
