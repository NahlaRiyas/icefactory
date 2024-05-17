import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefactory/notificatn.dart';
import 'package:icefactory/cart.dart';
import 'package:icefactory/homescreen.dart';
import 'package:icefactory/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'global_variable.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  List pages = [
    HomeScreen(),
    CartScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List navbarItem = [
    {"image": SvgPicture.asset("assets/images/home.svg"), "name": "Home"},
    {
      "image": SvgPicture.asset(
        "assets/images/cart.svg",
        height: width * 0.06,
      ),
      "name": "Cart",
    },
    {
      "image": SvgPicture.asset("assets/images/notification.svg"),
      "name": "Notification",
    },
    {
      "image": SvgPicture.asset("assets/images/profile.svg"),
      "name": "Profile",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: width * 0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(width * 0.12),
                topLeft: Radius.circular(width * 0.12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset.zero,
                  spreadRadius: 2,
                  blurRadius: 4)
            ]),
        width: width,
        child: Center(
          child: SalomonBottomBar(
            curve: Curves.easeInOut,
            currentIndex: currentIndex,
            backgroundColor: Colors.transparent,
            onTap: onTap,
            items: [
              ///Home
              SalomonBottomBarItem(
                icon: SvgPicture.asset("assets/images/home.svg"),
                title: Text(
                  "Home",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.03),
                ),
                selectedColor: Colors.grey,
              ),

              /// Cart
              SalomonBottomBarItem(
                icon: SvgPicture.asset("assets/images/cart.svg"),
                title: Text(
                  "Cart",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.03),
                ),
                selectedColor: Colors.grey,
              ),

              /// Notification
              SalomonBottomBarItem(
                icon: SvgPicture.asset("assets/images/notification.svg"),
                title: Text(
                  "Notification",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.03),
                ),
                selectedColor: Colors.grey,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: SvgPicture.asset("assets/images/profile.svg"),
                title: Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.03),
                ),
                selectedColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
