import 'package:flutter/material.dart';

class   AppColors {

  // Brand Colors (RGBO)
  static const primary = Color.fromRGBO(151, 28, 0, 1.0);        // #971C00
  static const primaryLight = Color.fromRGBO(187, 53, 16, 1.0);  // #BB3510
  static const highlight = Color.fromRGBO(255, 106, 0, 1.0);     // #FF6A00
  static const grey = Color.fromRGBO(157, 158, 166, 1.0);

  static const background = Color.fromRGBO(247, 245, 244, 1.0);  // #F7F5F4
  static const cardBackground = Color.fromRGBO(255, 255, 255, 1.0); //#FFFFFFFF
  static const hint = Color.fromRGBO(122, 111, 107, 1.0);


  static const text = Color.fromRGBO(26, 26, 26, 1.0);           // #1A1A1A
  static const layout = Color.fromRGBO(26, 26, 26, 0.5019607843137255);           // #1A1A1A
  static const border = Color.fromRGBO(229, 216, 210, 1.0);      // #E5D8D2FF

  static const light = Color.fromRGBO(1, 1, 1, 0.2);
  static const header = Color.fromRGBO(255, 232, 227, 1.0);
  static const success = Color.fromRGBO(39, 174, 96, 1.0);

  static const black = Color.fromRGBO(0, 0, 0, 1.0);
  static const white = Color.fromRGBO(255, 255, 255, 1.0);
  static const transparent = Color.fromRGBO(0, 0, 0, 0.0);

  // 🔥 Brand Hero Gradient (#971C00 → #FF6A00)
  static const heroGradient = LinearGradient(
    colors: [
      Color.fromRGBO(151, 28, 0, 1.0),
      Color.fromRGBO(255, 106, 0, 1.0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 🌅 Soft Warm Gradient (#CC4A23 → #E8D5C5)
  static const warmGradient = LinearGradient(
    colors: [
      Color.fromRGBO(204, 74, 35, 1.0),
      Color.fromRGBO(232, 213, 197, 1.0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // 🖤 Dark Mode Glow Gradient (#6C1400 → #FF4400)
  static const darkGlowGradient = LinearGradient(
    colors: [
      Color.fromRGBO(108, 20, 0, 1.0),
      Color.fromRGBO(255, 68, 0, 1.0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const linearGradient = LinearGradient(
    colors: [
      Color.fromRGBO(0, 0, 0, 0.0),
      Color.fromRGBO(255, 106, 0, 0.4),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  // Buttons
  static const primaryButtonBg = Color.fromRGBO(151, 28, 0, 1.0);
  static const primaryButtonHover = Color.fromRGBO(187, 53, 16, 1.0);
  static const primaryButtonText = Color.fromRGBO(255, 255, 255, 1.0);

  static const secondaryButtonBg = Color.fromRGBO(242, 230, 225, 1.0);
  static const secondaryButtonHover = Color.fromRGBO(234, 215, 207, 1.0);
  static const secondaryButtonText = Color.fromRGBO(151, 28, 0, 1.0);

}
