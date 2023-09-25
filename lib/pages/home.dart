import 'package:flutter/material.dart';
import 'package:recipe_book/db/functions/db_functions.dart';
import 'package:recipe_book/db/model/data_model.dart';
import 'package:recipe_book/helpers/colors.dart';
import 'package:recipe_book/pages/editscreen.dart';
import 'package:recipe_book/pages/tutorialpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    getAllRecipes();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Roberta Anny ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: usernamegrey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Find Your Recipes',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'For Cooking',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // Search Field
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  hintText: 'Search your item',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: recipeListNotifier,
                  builder: (BuildContext ctx, List<RecipeModel> recipeList,
                      Widget? child) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: recipeList.length,
                      itemBuilder: (context, index) {
                        final data = recipeList[index];
                        return recipecard(context, data, index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  recipecard(BuildContext context, data, index) {
    bool isfavourite = favouriterecipe.contains(data);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => tutorialscreen(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              height: 205,
              decoration: BoxDecoration(
                color: boxgrey,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => editscreen(),
                          ));
                          // Add your edit functionality here
                        },
                        icon: Image.asset(
                          'assets/icons/edit.png',
                          height: 20,
                        ),
                        color: Colors.white,
                      ),
                      IconButton(
                          onPressed: () {
                            deleteRecipe(index);
                          },
                          icon: Image.asset(
                            'assets/icons/delete.png',
                            height: 24,
                          )),
                      IconButton(
                        onPressed: () {
                          if (!isfavourite) {
                            favouriterecipe.add(data);
                          }
                          // Add your favorites functionality here
                        },
                        icon: Image.asset(
                          'assets/icons/bookmark.png',
                          height: 20,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(22, -40),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2))
                    ]),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/food.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    data.foodname, // Replace with the actual food name
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    data.totalcost, // Replace with the actual food name
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
