import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:recipe_book/db/model/data_model.dart';

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

  print('recipe deleted successfully');
}

//edit function

editRecipe(index, RecipeModel value) async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
  recipeListNotifier.value.clear();
  recipeListNotifier.value.addAll(recipeDB.values);
  recipeDB.putAt(index, value);
  getAllRecipes();
  print('recipe update successfully');
}

addtofavourites(RecipeModel data) async {
  final favDB = await Hive.openBox<RecipeModel>('fav_db');
  if (!favouriterecipe.contains(data)) {
    favouriterecipe.add(data);
    favDB.add(data);
  }
}

loadFavourites() async {
  final favDB = await Hive.openBox<RecipeModel>('fav_db');
  favouriterecipe.clear();
  favouriterecipe = favDB.values.toList();
}

deleteFavourites(int id) async {
  final favDB = await Hive.openBox<RecipeModel>('fav_db');
  favDB.deleteAt(id);
  favouriterecipe.removeAt(id);
  loadFavourites();
}
