import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/helpers/colors.dart';
import 'package:recipe_book/pages/createscreen.dart';
import 'package:recipe_book/pages/favourites.dart';
import 'package:recipe_book/pages/home.dart';
import 'package:recipe_book/pages/notifications.dart';
import 'package:recipe_book/pages/totalcost.dart';

class bottom_nav extends StatefulWidget {
  const bottom_nav({super.key});

  @override
  State<bottom_nav> createState() => _bottom_navState();
}

class _bottom_navState extends State<bottom_nav> {
  int _selectedindex = 0;
  bottomNavigator(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  List pages = [
    Homepage(),
    FavouritesScreen(),
    Createscreen(),
    NotificationsScreen(),
    TotalCost()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: pages[_selectedindex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DotNavigationBar(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 4,
                ),
              ],
              backgroundColor: Color.fromARGB(255, 244, 54, 54),
              currentIndex: _selectedindex,
              onTap: bottomNavigator,
              items: [
                DotNavigationBarItem(
                    icon: Image.asset(
                  'assets/icons/Active-home.png',
                  height: 30,
                )),
                DotNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/Active-fav.png',
                    height: 30,
                  ),
                ),
                DotNavigationBarItem(
                    icon: Image.asset(
                  'assets/icons/add.png',
                  color: Colors.white,
                  height: 30,
                )),
                DotNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/notification (1).png',
                    color: Colors.white,
                    height: 30,
                  ),
                ),
                DotNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/price-tag.png',
                    color: Colors.white,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
