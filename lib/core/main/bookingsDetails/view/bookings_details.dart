import 'package:flutter/material.dart';

import '../../../../config/appbars/main_appbar.dart';
import '../../../../config/themes/app_colors.dart';
class BookingsDetails extends StatefulWidget {
  const BookingsDetails({super.key});

  @override
  State<BookingsDetails> createState() => _BookingsDetailsState();
}

class _BookingsDetailsState extends State<BookingsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            MainAppbar(type: MainAppbarTypes.partners),
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.grey,
        ),
        ]
        ),
      ),
    );
  }
}
