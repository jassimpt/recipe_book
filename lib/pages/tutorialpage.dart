import 'package:flutter/material.dart';
import 'package:recipe_book/db/model/data_model.dart';
import 'package:recipe_book/helpers/colors.dart';
import 'package:recipe_book/pages/totalcost.dart';

class tutorialscreen extends StatelessWidget {
  tutorialscreen({super.key, required this.recipe});
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
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/foodimage1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TotalCost(),
                          ));
                          // totalcost button function
                        },
                        child: const Text(
                          'Total cost',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
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
                          child: Row(
                            children: [
                              SizedBox(
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
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                              ),
                            ],
                          ),
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: boxgrey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                  decoration: const BoxDecoration(
                      color: boxgrey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                        ''' Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown 
                    printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                     but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                     and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'''),
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
