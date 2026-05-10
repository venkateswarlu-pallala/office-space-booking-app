import 'package:flutter/material.dart';
import 'package:homler/config/elements/anim_button.dart';
import 'package:homler/config/themes/font_styles.dart';

import '../routes/routers.dart';
import '../themes/app_colors.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {

          double logoHeight = constraints.maxWidth < 1100
              ? 28
              : constraints.maxWidth < 1300
              ? 36
              : 42;
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              AnimButton(
                onTap: _onHomeClick,
                child: Image.asset('assets/logos/logo_homler.png',
                 height: logoHeight,
                ),

              ),

               Spacer(),
              Container(
                width: 300,
                height: 36,
                padding:  EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 18, color: Colors.grey.shade600),
                     SizedBox(width: 6),
                    Text("Search", style: FontStyles.s14HintW5),
                  ],
                ),
              ),

               SizedBox(width: 32),


              Container(
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("Log in", style: FontStyles.s16Text5),
              ),
            ],
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.grey,
          ),
        ],
      ),
    );

        },

    );
  }

  void _onHomeClick() => homeRoute.navigate;

}
