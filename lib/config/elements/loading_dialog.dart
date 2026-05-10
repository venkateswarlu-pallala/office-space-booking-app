// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../themes/app_colors.dart';
// import '../themes/decorations.dart';
//
// void showLoading({String? message}) {
//   Get.dialog(
//     Dialog(
//       child: Container(
//         decoration: Decorations.card,
//         constraints: BoxConstraints(maxWidth: 80, maxHeight: 300),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const CircularProgressIndicator(color: AppColors.primary),
//             const SizedBox(height: 16),
//             Text(
//               message ?? "Loading...",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//     ),
//     barrierDismissible: false,
//   );
// }
