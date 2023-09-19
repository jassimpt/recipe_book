import 'package:flutter/material.dart';
import 'package:recipe_book/colors/colors.dart';
import 'package:recipe_book/pages/editscreen.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount:
                      2, // Change this to the number of grid items you want
                  itemBuilder: (context, index) {
                    return recipecard(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recipecard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            height: 220,
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
                        // Add your favorites functionality here
                      },
                      icon: Image.asset(
                        'assets/icons/Bookmark.png',
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
                        offset: Offset(0, 2))
                  ]),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/food.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Pepper sweetcorn', // Replace with the actual food name
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Ramen', // Replace with the actual food name
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
    );
  }
}
