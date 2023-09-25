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
    List images = [
      'assets/images/foodimage1.png',
      'assets/images/foodimage2.png',
      'assets/images/foodimage3.png'
    ];
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
              favouritesBuilder(images)
            ],
          ),
        ),
      ),
    );
  }

  Expanded favouritesBuilder(List<dynamic> images) {
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
                        builder: (context) => tutorialscreen(),
                      ));
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[index]),
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
                  fontSize: 22,
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
