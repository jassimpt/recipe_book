import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int _selectedindex = 0;
  int get selectedindex => _selectedindex;
  pageNavigator(int index) {
    _selectedindex = index;
    notifyListeners();
  }
}
