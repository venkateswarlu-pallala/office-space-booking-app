//  import 'package:flutter/material.dart';
//
// class CommunicationHelper {
//   /// 📞 Make a phone call
//   static Future<void> call(String phoneNumber) async {
//     final cleaned = _normalizePhone(phoneNumber);
//     final Uri uri = Uri(scheme: 'tel', path: cleaned);
//     await _launch(uri);
//   }
//
//   /// 💬 Send an SMS message
//   static Future<void> message(String phoneNumber, {String? text}) async {
//     final cleaned = _normalizePhone(phoneNumber);
//     final Uri uri = Uri(
//       scheme: 'sms',
//       path: cleaned,
//       queryParameters: text != null ? {'body': text} : null,
//     );
//     await _launch(uri);
//   }
//
//   /// 🟢 Send a WhatsApp message
//   static Future<void> whatsapp(String phoneNumber, {String? text}) async {
//     final cleaned = _normalizePhone(phoneNumber);
//     final encodedText = Uri.encodeComponent(text ?? '');
//     final Uri uri = Uri.parse(
//       'https://wa.me/$cleaned${text != null ? "?text=$encodedText" : ""}',
//     );
//     await _launch(uri);
//   }
//
//   /// Internal helper to normalize phone numbers
//   static String _normalizePhone(String phone) {
//     // Keep only digits and '+' (for international numbers)
//     return phone.replaceAll(RegExp(r'[^\d+]'), '');
//   }
//
//   /// Internal method: safely open URLs
//   static Future<void> _launch(Uri uri) async {
//     try {
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//       } else {
//         debugPrint('⚠️ Could not launch $uri');
//       }
//     } catch (e) {
//       debugPrint('❌ Launch failed: $e');
//     }
//   }
//
//   static Future<void> mail(String? email, String message) async {
//     if (email == null || email.isEmpty) return;
//     final Uri uri = Uri(
//       scheme: 'mailto',
//       path: email,
//       queryParameters: {'subject': 'Message from Doland CRM', 'body': message},
//     );
//     _launch(uri);
//   }
// }
