import 'package:flutter/material.dart';
import 'package:recipe_book/pages/createscreen.dart';
import 'package:recipe_book/pages/favourites.dart';
import 'package:recipe_book/pages/home.dart';
import 'package:recipe_book/pages/notifications.dart';
import 'package:recipe_book/pages/settings.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _selectedindex = 0;
  void _bottomnavigator(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _pages = [
    Homepage(),
    FavouritesScreen(),
    NotificationsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Createscreen(),
              ));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 70, // Set your desired height here
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.none, // Set clip behavior to none
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: _selectedindex == 0
                    ? Image.asset(
                        'assets/icons/Active-home.png',
                        height: 25,
                      )
                    : Image.asset(
                        'assets/icons/Inactive-home.png',
                        height: 25,
                      ),
                onPressed: () {
                  _bottomnavigator(0);
                },
              ),
              IconButton(
                icon: _selectedindex == 1
                    ? Image.asset(
                        'assets/icons/Active-fav.png',
                        height: 25,
                      )
                    : Image.asset(
                        'assets/icons/Inactive-fav.png',
                        height: 25,
                      ),
                onPressed: () {
                  _bottomnavigator(1);
                },
              ),
              SizedBox(),
              IconButton(
                icon: _selectedindex == 2
                    ? Image.asset(
                        'assets/icons/active-noti.png',
                        height: 25,
                      )
                    : Image.asset(
                        'assets/icons/Inactive-noti.png',
                        height: 25,
                      ),
                onPressed: () {
                  _bottomnavigator(2);
                },
              ),
              IconButton(
                icon: _selectedindex == 3
                    ? Image.asset(
                        'assets/icons/active-setti.png',
                        height: 25,
                      )
                    : Image.asset(
                        'assets/icons/inactive-setti.png',
                        height: 25,
                      ),
                onPressed: () {
                  _bottomnavigator(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
