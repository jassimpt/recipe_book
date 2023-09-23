import 'package:flutter/material.dart';

class RecipeModel {
  final String foodname;
  final String ingredient;
  final String quantity;
  final String price;
  final String description;

  RecipeModel(
      {required this.foodname,
      required this.ingredient,
      required this.price,
      required this.quantity,
      required this.description});
}
