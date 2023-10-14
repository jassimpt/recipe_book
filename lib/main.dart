import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_book/db/functions/db_functions.dart';
import 'package:recipe_book/db/model/data_model.dart';

import 'package:recipe_book/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(RecipeModelAdapter().typeId)) {
    Hive.registerAdapter(RecipeModelAdapter());
  }
  loadFavourites();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Onboardingpage(),
      title: 'Recipe Book',
      debugShowCheckedModeBanner: false,
    );
  }
}
