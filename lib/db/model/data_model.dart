import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class RecipeModel {
  @HiveField(0)
  final String foodname;

  @HiveField(1)
  final String ingredients;

  @HiveField(2)
  final String totalcost;

  @HiveField(3)
  final String description;

  RecipeModel(
      {required this.foodname,
      required this.ingredients,
      required this.totalcost,
      required this.description});
}
