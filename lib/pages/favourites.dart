import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_book/db/functions/db_functions.dart';
import 'package:recipe_book/pages/tutorialpage.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
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

  Expanded favouritesBuilder() {
    return Expanded(
      child: ListView.builder(
        itemCount: favouriterecipe.length,
        itemBuilder: (context, index) {
          final recipe = favouriterecipe[index];
          bool isfavourite = favouriterecipe.contains(recipe);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      // details page function
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => tutorialscreen(recipe: recipe),
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
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: recipe.image != null
                              ? FileImage(File(recipe.image!))
                              : AssetImage('assets/images/no-image.jpg')
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
                            if (isfavourite) {
                              favouriterecipe.remove(recipe);
                            }
                            setState(() {});
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
                style: TextStyle(
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
  }
}
