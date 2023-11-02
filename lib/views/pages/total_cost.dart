import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recipe_book/controllers/db_function_provider.dart';
import 'package:recipe_book/models/data_model.dart';

import 'package:recipe_book/utils/chart.dart';

class TotalCost extends StatefulWidget {
  const TotalCost({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalCost> createState() => _TotalCostState();
}

class _TotalCostState extends State<TotalCost> {
  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipes =
        Provider.of<FunctionProvider>(context).recipeList;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Total cost',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Recipes Total Cost',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹ ${calculateTotalCost(recipes)}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    ChartScreen(recipes: recipes),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
