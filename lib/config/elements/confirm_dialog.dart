import 'dart:ui';

import 'package:flutter/material.dart';

/// ------------------------------------------------------
/// APPLE STYLE CONFIRM DIALOG (FINAL FIXED VERSION)
/// ------------------------------------------------------
class ConfirmDialog extends StatelessWidget {
  final String? title;
  final String description;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const ConfirmDialog({
    super.key,
    this.title,
    required this.description,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // MUST for blur + overlay
      child: Stack(
        children: [
          // BACKGROUND BLUR
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(color: Colors.black),
          ),

          // CENTERED CARD
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.85, end: 1),
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutBack,

              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },

              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500), // FIXED!
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null && title!.isNotEmpty)
                        Text(
                          title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),

                      const SizedBox(height: 12),

                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.45,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Divider(height: 1),

                      // CONFIRM
                      InkWell(
                        onTap: onConfirm,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: const Text(
                            "Confirm",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),

                      const Divider(height: 1),

                      // CANCEL
                      InkWell(
                        onTap: onCancel,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: const Text(
                            "Cancel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------
/// FIXED showConfirm() FUNCTION
/// ------------------------------------------------------
void showConfirm({
  required String description,
  String title = "",
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) {
  final confirm = onConfirm;
  final cancel = onCancel;

  var Get;
  Get.dialog(
    ConfirmDialog(
      title: title,
      description: description,
      onConfirm: () {
        if (confirm == null) Get.back();
        confirm?.call();
      },
      onCancel: () {
        if (cancel == null) Get.back();
        cancel?.call();
      },
    ),
    barrierDismissible: true,
  );
}
