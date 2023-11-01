import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:recipe_book/models/data_model.dart';

class FunctionProvider extends ChangeNotifier {
  List<RecipeModel> recipeList = [];
  List<RecipeModel> favouriterecipe = [];
  List<RecipeModel> foundrecipe = [];
  List<RecipeModel> result = [];

  void addRecipe(RecipeModel value) async {
    final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
    await recipeDB.add(value);
    recipeList.add(value);
    notifyListeners();
  }

  getAllRecipes() async {
    final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
    recipeList.clear();
    recipeList.addAll(recipeDB.values);
    notifyListeners();
  }

  deleteRecipe(int id) async {
    final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
    recipeDB.deleteAt(id);
    getAllRecipes();
    notifyListeners();
  }

  editRecipe(index, RecipeModel value) async {
    final recipeDB = await Hive.openBox<RecipeModel>('recipe_db');
    recipeList.clear();
    recipeList.addAll(recipeDB.values);
    recipeDB.putAt(index, value);
    getAllRecipes();
    notifyListeners();
  }

  addtofavourites(RecipeModel data) async {
    final favDB = await Hive.openBox<RecipeModel>('fav_db');
    if (!favouriterecipe.contains(data)) {
      favouriterecipe.add(data);
      favDB.add(data);
      notifyListeners();
    }
  }

  loadFavourites() async {
    final favDB = await Hive.openBox<RecipeModel>('fav_db');
    favouriterecipe.clear();
    favouriterecipe = favDB.values.toList();
    notifyListeners();
  }

  deleteFavourites(int id) async {
    final favDB = await Hive.openBox<RecipeModel>('fav_db');
    favDB.deleteAt(id);
    favouriterecipe.removeAt(id);
    loadFavourites();
    notifyListeners();
  }

  loadrecipes() {
    final allrecipes = recipeList;
    foundrecipe = allrecipes;
  }

  filterRecipes(String searchterm) {
    if (searchterm.isEmpty) {
      result = recipeList;
    } else {
      result = recipeList
          .where((RecipeModel recipe) =>
              recipe.foodname.toLowerCase().contains(searchterm.toLowerCase()))
          .toList();
    }
    foundrecipe = result;
    notifyListeners();
  }
}
