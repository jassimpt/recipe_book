import 'package:flutter/material.dart';
import 'package:recipe_book/views/widgets/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final usernameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? userName;

  checkLogin(context) async {
    if (formkey.currentState!.validate()) {
      String userName = usernameController.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', userName);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BottomNav(savedusername: userName),
      ));
      notifyListeners();
    }
  }

  loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('username');
    notifyListeners();
  }
}
