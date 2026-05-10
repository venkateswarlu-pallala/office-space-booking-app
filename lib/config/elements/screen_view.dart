import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';

class ScreenView extends StatelessWidget {
  final Widget? mobile;
  final Widget? tab;
  final Widget? web;

  const ScreenView({super.key, this.mobile, this.tab, this.web});

  @override
  Widget build(BuildContext context) {
    if (context.width < minScreen) return mobile ?? Container();
    if (context.width <= tabScreen) return tab ?? Container();
    return web ?? Container();
  }
}
