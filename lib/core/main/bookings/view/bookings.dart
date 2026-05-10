import 'package:flutter/material.dart';
import 'package:homler/config/appbars/footer.dart';
import 'package:homler/config/appbars/main_appbar.dart';
import 'package:homler/core/main/bookings/view/booking_card.dart';
import '../../../../config/themes/app_colors.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             MainAppbar(
              type: MainAppbarTypes.bookings,
            ),

             Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey,
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                   SizedBox(height: 24),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      int cardsPerRow;
                      if (constraints.maxWidth < 600) {
                        cardsPerRow = 1; // Mobile
                      } else if (constraints.maxWidth < 1000) {
                        cardsPerRow = 2; // Tablet
                      } else {
                        cardsPerRow = 3; // Web
                      }

                      double cardWidth =
                          (constraints.maxWidth / cardsPerRow) - 16;

                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: List.generate(
                          12,
                              (index) => SizedBox(
                            width: cardWidth,
                            child:  BookingCard(),
                          ),
                        ),
                      );
                    },
                  ),

                   SizedBox(height: 90),


                   Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
