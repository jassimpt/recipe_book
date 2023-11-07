import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/controllers/page_provider.dart';

import 'package:recipe_book/views/pages/favourites.dart';
import 'package:recipe_book/views/pages/home.dart';
import 'package:recipe_book/views/pages/notifications.dart';
import 'package:recipe_book/views/pages/total_cost.dart';

class BottomNav extends StatelessWidget {
  BottomNav({
    super.key,
    required this.savedusername,
  });
  final savedusername;

  @override
  Widget build(BuildContext context) {
    final List pages = [
      Homepage(savedusername: savedusername),
      FavouritesScreen(),
      NotificationsScreen(),
      TotalCost(),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: pages[
                Provider.of<PageProvider>(context, listen: true).selectedindex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer(
              builder: (context, value, child) {
                return DotNavigationBar(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 4,
                    ),
                  ],
                  backgroundColor: const Color.fromARGB(255, 244, 54, 54),
                  currentIndex:
                      Provider.of<PageProvider>(context, listen: false)
                          .selectedindex,
                  onTap: (index) => bottomNavigator(context, index),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

bottomNavigator(BuildContext context, int index) {
  Provider.of<PageProvider>(context, listen: false).pageNavigator(index);
}
