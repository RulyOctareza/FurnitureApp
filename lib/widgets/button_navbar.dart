import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';

class ButtonNavbar extends StatefulWidget {
  const ButtonNavbar({super.key});

  @override
  State<ButtonNavbar> createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BottomNavigationBar(
        backgroundColor: kWhiteColor,
        selectedLabelStyle: blackTextStyle,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              'assets/icon_home.png',
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Wishlist',
            icon: Image.asset(
              'assets/icon_wishlist.png',
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Image.asset(
              'assets/icon_profile.png',
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
