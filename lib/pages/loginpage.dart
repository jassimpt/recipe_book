import 'package:flutter/material.dart';
import 'package:recipe_book/widgets/bottom_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 8),
            child: Image.asset(
              'assets/images/design-cooking-bg.png',
              height: 400,
              width: 400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 245, 245),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recipes that',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    const Text('Inspire you to',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                    const Text('do more!',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 30,
                    ),

                    // USERNAME TEXTFIELD

                    Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        // LOGIN BUTTON

                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => bottom_nav(),
                              ));
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 110, right: 110),
                              child: Text(
                                'Login Now',
                                style: TextStyle(fontSize: 16),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
