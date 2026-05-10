// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
//
// class FetchingControl extends GetxController{
//   final RxBool _isLoading = false.obs;
//   bool get loading => _isLoading.value;
//   void setLoading(bool value)=>_isLoading.value = value;
//   get fetching{
//     _isLoading.value = true;
//   }
//   get finish{
//     _isLoading.value = false;
//   }
// }
//
// class RxBool {
// }
//
// class GetxController {
// }
//
// class Fetching extends StatefulWidget {
//
//   final FetchingControl controller;
//   final double maxProgressWidth;
//   final double height;
//   final Color color;
//   final Color backgroundColor;
//
//   const Fetching(
//       {super.key,
//         this.color = AppColors.primary,
//         this.backgroundColor = Colors.transparent,
//         this.maxProgressWidth = 100,
//         this.height = 1.0, required this.controller});
//
//
//   @override
//   State<Fetching> createState() =>
//       _FetchingState();
// }
//
//
// class _FetchingState
//     extends State<Fetching>
//     with SingleTickerProviderStateMixin {
//
//   late AnimationController animCtrl =
//   AnimationController(vsync: this, duration: const Duration(seconds: 1))
//     ..addListener(() {
//       setState(() {});
//     })
//     ..repeat(reverse: true);
//
//   late Animation animation =
//   Tween<double>(begin: -1, end: 1).animate(animCtrl);
//
//
//
//   @override
//   void dispose() {
//     animCtrl.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RepaintBoundary(
//       child: Obx(() => SizedBox(
//         height: widget.height,
//         child: Visibility(
//           visible: widget.controller.loading,
//           child: ColoredBox(
//             color: widget.backgroundColor,
//             child: Align(
//               alignment: Alignment(animation.value, 0),
//               child: Container(
//                 decoration: ShapeDecoration(
//                   color: widget.color,
//                   shape: const StadiumBorder(),
//                 ),
//                 // you can use animatedContainer, seems not needed
//                 width: widget.maxProgressWidth -
//                     widget.maxProgressWidth * (animation.value as double).abs(),
//               ),
//             ),
//           ),
//         ),
//       )),
//     );
//   }
//
// }