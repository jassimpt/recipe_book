import 'package:flutter/material.dart';
import 'package:recipe_book/views/pages/login_page.dart';
import 'package:recipe_book/views/widgets/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  @override
  void initState() {
    userNameChecker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/bg-burg.jpg',
              height: height, width: width, fit: BoxFit.cover),
          const Positioned(
            top: 500,
            left: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Let's",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Cooking',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Find best recipes for cooking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  splashLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  userNameChecker() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    if (username == null || username.isEmpty) {
      splashLogin();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BottomNav(savedusername: username),
      ));
    }
  }
}
