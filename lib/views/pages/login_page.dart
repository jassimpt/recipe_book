import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/controllers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Form(
          key: Provider.of<LoginProvider>(context).formkey,
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
                        controller: Provider.of<LoginProvider>(context)
                            .usernameController,
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
                            // checklogin(context);
                            Provider.of<LoginProvider>(context, listen: false)
                                .checkLogin(context);
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
}
