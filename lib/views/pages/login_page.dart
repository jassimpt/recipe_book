import 'package:flutter/material.dart';
import 'package:recipe_book/views/widgets/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 8),
                child: Image.asset(
                  'assets/images/design-cooking-bg.png',
                  height: 400,
                  width: 400,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 420,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 245, 245),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recipes that',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Inspire you to',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'do more!',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is needed!';
                          }
                          return null;
                        },
                        controller: usernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            checklogin();
                          },
                          child: const Text(
                            'Login Now',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checklogin() async {
    if (formkey.currentState!.validate()) {
      String userName = usernameController.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', userName);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BottomNav(savedusername: userName),
      ));
    }
  }
}
