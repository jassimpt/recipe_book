import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_book/models/data_model.dart';
import 'package:recipe_book/helpers/colors.dart';

// ignore: must_be_immutable
class TutorialScreen extends StatelessWidget {
  TutorialScreen({super.key, required this.recipe});
  RecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    List ingredients = recipe.ingredients.split(',');

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/icons/Arrow-Left.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'How to make ${recipe.foodname}',
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x000000).withOpacity(1),
                        spreadRadius: -9,
                        blurRadius: 12,
                        offset: const Offset(2, 0),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: recipe.image != null
                          ? FileImage(File(recipe.image!))
                          : const AssetImage('assets/images/no-image.jpg')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: ingredients.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: boxgrey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                'assets/icons/harvest.png',
                                height: 40,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                ingredients[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Tutorial',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: const BoxConstraints(minHeight: 150),
                  decoration: const BoxDecoration(
                      color: boxgrey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      recipe.description,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
