import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_book/db/model/data_model.dart';
import 'package:recipe_book/pages/favourites.dart';

ValueNotifier<List<RecipeModel>> recipeListNotifier = ValueNotifier([]);
List<RecipeModel> favouriterecipe = [];

// Recipe adding function
void addRecipe(RecipeModel value) async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
  await recipeDB.add(value);
  recipeListNotifier.value.add(value);
  print('Recipe saved to db success');
  recipeListNotifier.notifyListeners();
}

// getting recipes from db function
getAllRecipes() async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
  recipeListNotifier.value.clear();
  recipeListNotifier.value.addAll(recipeDB.values);
  recipeListNotifier.notifyListeners();
  print('recipe getted or loaded from db success');
}

// delete recipe functon

deleteRecipe(int id) async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
  recipeDB.deleteAt(id);
  getAllRecipes();
}
