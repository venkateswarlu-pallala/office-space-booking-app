import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homler/config/elements/anim_button.dart';
import 'package:homler/config/routes/routers.dart';
import 'package:homler/config/themes/font_styles.dart';


enum MainAppbarTypes {
  home,
  bookings,
  partners,
  aboutUs,
  marketing,
  initial
}

class MainAppbar extends StatefulWidget {
  final MainAppbarTypes? type;

  const MainAppbar({super.key, this.type});

  @override
  State<MainAppbar> createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar> {
  final activeTab = MainAppbarTypes.initial.obs;

  @override
  void initState() {
    activeTab.value = widget.type ?? MainAppbarTypes.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;

        double logoHeight = constraints.maxWidth < 1100
            ? 28
            : constraints.maxWidth < 1300
            ? 36
            : 42;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24,),
          child: Row(
            children: [
              /// LOGO
              AnimButton(
                onTap: _onHomeClick,
                child: Image.asset(
                  'assets/logos/logo_homler.png',
                  height: logoHeight,
                ),
              ),

              const Spacer(),

              /// DESKTOP MENU
              if (!isMobile) _desktopMenu(logoHeight),

              /// MOBILE MENU
              if (isMobile) _mobileMenu(),
            ],
          ),
        );
      },
    );
  }

  // ===================== DESKTOP MENU =====================

  Widget _desktopMenu(double width) {
    double menuSpacing;

    if (width < 1100) {
      menuSpacing = 12;
    } else {
      menuSpacing = 24;
    }
    return Obx(
          () => Row(
        spacing: menuSpacing,
        children: [
          ..._menuItems(),

          /// SEARCH
          _searchBox(),

          /// LOGIN
          AnimButton(
            onTap: _onLoginClick,
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("Log in", style: FontStyles.s16Text5),
            ),
          ),
        ],
      ),
    );
  }

  // ===================== MOBILE MENU =====================

  Widget _mobileMenu() {
    return PopupMenuButton<MainAppbarTypes>(
      icon: const Icon(Icons.menu, size: 20),
      onSelected: (value) {
        activeTab.value = value;
        _navigate(value);
      },
      itemBuilder: (context) => [
        _popupItem("Home", MainAppbarTypes.home),
        _popupItem("Bookings", MainAppbarTypes.bookings),
        _popupItem("Partners", MainAppbarTypes.partners),
        _popupItem("Marketing", MainAppbarTypes.marketing),
        _popupItem("About Us", MainAppbarTypes.aboutUs),
      ],
    );
  }

  PopupMenuItem<MainAppbarTypes> _popupItem(
      String title, MainAppbarTypes type) {
    return PopupMenuItem(
      value: type,
      child: Text(title, style: FontStyles.s16Text5),
    );
  }

  // ===================== MENU ITEMS =====================

  List<Widget> _menuItems() {
    return [
      _menuItem("Home", MainAppbarTypes.home, _onHomeClick),
      _menuItem("Bookings", MainAppbarTypes.bookings, _onBookingsClick),
      _menuItem("Partners", MainAppbarTypes.partners, _onPartnersClick),
      _menuItem("Marketing", MainAppbarTypes.marketing, _onMarketingClick),
      _menuItem("About Us", MainAppbarTypes.aboutUs, _onAboutUsClick),
    ];
  }

  Widget _menuItem(
      String title,
      MainAppbarTypes type,
      VoidCallback onTap,
      ) {
    return AnimButton(
      onTap: () {
        activeTab.value = type;
        onTap();
      },
      child: Text(
        title,
        style: activeTab.value == type
            ? FontStyles.s16Button5
            : FontStyles.s16Text5,
      ),
    );
  }

  // ===================== SEARCH =====================

  Widget _searchBox() {
    return ElevatedButton(
      onPressed: _onSearchClick,
      child: Row(
        children: [
          Icon(Icons.search, size: 18, color: Colors.grey.shade600),
          const SizedBox(width: 6),
          (Text("Search", style: FontStyles.s12HintW5, )),
        ],
      ),
    );
  }

  // ===================== NAVIGATION =====================

  void _navigate(MainAppbarTypes type) {
    switch (type) {
      case MainAppbarTypes.home:
        _onHomeClick();
        break;
      case MainAppbarTypes.bookings:
        _onBookingsClick();
        break;
      case MainAppbarTypes.partners:
        _onPartnersClick();
        break;
      case MainAppbarTypes.marketing:
        _onMarketingClick();
        break;
      case MainAppbarTypes.aboutUs:
        _onAboutUsClick();
        break;
      default:
        break;
    }
  }

  void _onHomeClick() => homeRoute.navigate;
  void _onBookingsClick() => bookingsRoute.navigate;
  void _onPartnersClick() => partnersRoute.navigate;
  void _onMarketingClick() => marketingRoute.navigate;
  void _onAboutUsClick() => aboutUsRoute.navigate;
  void _onLoginClick() => loginRoute.navigate;
  void _onSearchClick() => commercialSearchRoute.navigate;
}
