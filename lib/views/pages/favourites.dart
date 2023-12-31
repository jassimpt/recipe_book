import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/controllers/db_function_provider.dart';
import 'package:recipe_book/views/pages/tutorial.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<FunctionProvider>(context).loadFavourites();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saved recipes',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              favouritesBuilder()
            ],
          ),
        ),
      ),
    );
  }
}

favouritesBuilder() {
  return Consumer<FunctionProvider>(
    builder: (context, value, child) {
      return Expanded(
        child: ListView.builder(
          itemCount:
              Provider.of<FunctionProvider>(context).favouriterecipe.length,
          itemBuilder: (context, index) {
            final recipe =
                Provider.of<FunctionProvider>(context).favouriterecipe[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TutorialScreen(recipe: recipe),
                        ));
                      },
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: recipe.image != null
                                ? FileImage(File(recipe.image!))
                                : const AssetImage('assets/images/no-image.jpg')
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                            onPressed: () {
                              Provider.of<FunctionProvider>(context,
                                      listen: false)
                                  .deleteFavourites(index);
                            },
                            icon: Image.asset(
                              'assets/icons/bookmark.png',
                              height: 25,
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  recipe.foodname,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      );
    },
  );
}
