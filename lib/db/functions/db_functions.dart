import 'package:flutter/material.dart';
import 'package:recipe_book/db/model/data_model.dart';

ValueNotifier<List<RecipeModel>> recipeListNotifier = ValueNotifier([]);

void addrecipe(RecipeModel value) {
  recipeListNotifier.value.add(value);
}
