import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List notifications = [];
  void addNotification() {
    notifications.add(1);
  }
}
