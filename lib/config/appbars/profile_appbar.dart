import 'package:flutter/material.dart';
import 'package:homler/config/themes/font_styles.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Row(
        children: [

          Image.asset(
            'assets/logos/logo_homler.png',
            width: 200,
            height: 100,
          ),

          const Spacer(),


          Row(

            children: [

              Text("Home", style: FontStyles.s16Button5),
              SizedBox(width: 40),

              Text("Bookings", style: FontStyles.s16Text5),
              SizedBox(width: 40),
              Text("Partners", style: FontStyles.s16Text5),
              SizedBox(width: 40),

              Text("Marketing", style: FontStyles.s16Text5),
              SizedBox(width: 40),
              Text("About Us", style: FontStyles.s16Text5),
              SizedBox(width: 32),

            ],
          ),




          Container(
            width: 150,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 18, color: Colors.grey.shade600),
                const SizedBox(width: 6),
                Text("Search", style: FontStyles.s14PrimaryW5),
              ],
            ),
          ),

          const SizedBox(width: 32),


          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              'assets/images/image_profile.png',
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          )

        ],
      ),
    );
  }
}
