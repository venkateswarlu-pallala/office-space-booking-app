import 'dart:convert';

class BasicEnc {
  static String encode(String text) {
    return base64.encode(utf8.encode(text));
  }

  static String decode(String base64Text) {
    if (base64Text.isEmpty) return "";
    return utf8.decode(base64.decode(base64Text));
  }
}
