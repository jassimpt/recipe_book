import 'package:flutter/material.dart';
import 'package:recipe_book/pages/login_page.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/bg-burg.jpg',
              height: height, width: width, fit: BoxFit.cover),
          Positioned(
            top: 500,
            left: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Let's",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Cooking',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Find best recipes for cooking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 30, right: 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Start cooking'),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
