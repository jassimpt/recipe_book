import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/controllers/Images_provider.dart';
import 'package:recipe_book/controllers/db_function_provider.dart';
import 'package:recipe_book/controllers/login_provider.dart';
import 'package:recipe_book/controllers/noti_function_provider.dart';
import 'package:recipe_book/controllers/page_provider.dart';
import 'package:recipe_book/models/data_model.dart';

import 'package:recipe_book/views/pages/splash.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(RecipeModelAdapter().typeId)) {
    Hive.registerAdapter(RecipeModelAdapter());
  }
  // loadFavourites();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FunctionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        )
      ],
      child: MaterialApp(
        home: Onboardingpage(),
        title: 'Recipe Book',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
