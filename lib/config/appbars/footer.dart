import 'package:flutter/material.dart';
import 'package:homler/config/elements/anim_button.dart';
import 'package:homler/config/routes/routers.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.symmetric(vertical: 48, horizontal: 10),
      color: AppColors.primaryButtonBg,
      child: Column(
        children: [

          Wrap(
            spacing: 40,
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,

            children: [

              SizedBox(
                width: 260,
                child: AnimButton(
                  padding: EdgeInsets.zero,
                  onTap: _onHomeClick,
                  child: Image.asset(
                    'assets/logos/logo_homler_2.png',
                    height: 48,
                  ),
                ),
              ),

              _footerColumn(
                title: "Learn More",
                items: [
                  ("About us", _onAboutUsClick),
                  ("Marketing", _onMarketingClick),
                  ("Privacy Policy", () {}),
                  ("Contact Us", _onContactUsClick),
                ],
              ),

              /// TICKETS & BOOKING
              _footerColumn(
                title: "Tickets & Booking",
                items: [
                  ("Bookings", _onBookingsClick),
                  ("Partners", _onPartnersClick),
                  ("Support", _onSupportClick),
                ],
              ),

              /// CONTACT
              SizedBox(
                width: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Us", style: FontStyles.s18White4),
                    const SizedBox(height: 16),
                    Opacity(
                      opacity: .8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Commercial : +91 9652179774",
                            style: FontStyles.s14WhiteW4,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Ticket Office : 123-456-7890",
                            style: FontStyles.s14WhiteW4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// SOCIAL
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Social", style: FontStyles.s18White4),
                     SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          'assets/logos/logo_facebook.png',
                          height: 18,
                        ),
                         SizedBox(width: 16),
                        Image.asset(
                          'assets/logos/logo_instagram.png',
                          height: 18,
                        ),
                         SizedBox(width: 16),
                        Image.asset(
                          'assets/logos/logo_twitter.png',
                          height: 16,
                        ),
                         SizedBox(width: 16),
                        Image.asset(
                          'assets/logos/logo_youtube.png',
                          height: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

           SizedBox(height: 40),

          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white),

           SizedBox(height: 16),

          Opacity(
            opacity: 0.75,
            child: Text(
              "© 2025 Homler Bookings | All Rights Reserved",
              style: FontStyles.s14WhiteW4,textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerColumn({
    required String title,
    required List<(String, VoidCallback)> items,
  }) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: FontStyles.s18White4),
          const SizedBox(height: 16),
          Opacity(
            opacity: .8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (item) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnimButton(
                        padding: EdgeInsets.zero,
                        onTap: item.$2,
                        child: Text(
                          item.$1,
                          style: FontStyles.s14WhiteW4,
                        ),
                      ),
                    ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _onHomeClick() => homeRoute.navigate;
  void _onAboutUsClick() => aboutUsRoute.navigate;
  void _onBookingsClick() => bookingsRoute.navigate;
  void _onPartnersClick() => partnersRoute.navigate;
  void _onMarketingClick() => marketingRoute.navigate;
  void _onSupportClick() => supportRoute.navigate;
  void _onContactUsClick() => contactUsRoute.navigate;
}