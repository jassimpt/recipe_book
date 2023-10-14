import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/db/model/data_model.dart';
import 'package:recipe_book/helpers/colors.dart';

class chartScreen extends StatelessWidget {
  const chartScreen({
    super.key,
    required this.recipes,
  });

  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PieChart(
        PieChartData(
          sections: List.generate(
            recipes.length,
            (index) {
              double cost = double.parse(recipes[index].totalcost);
              double totalCost = calculateTotalCost(recipes);
              double percentage = (cost / totalCost) * 100;
              final image = recipes[index].image;

              return PieChartSectionData(
                badgePositionPercentageOffset: 1.1,
                titlePositionPercentageOffset: .4,
                badgeWidget: ClipOval(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image(
                      image: image != null
                          ? FileImage(File(image))
                          : const AssetImage('assets/images/food.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                color: getRandomColor(),
                value: percentage,
                title: '''₹ ${cost.toStringAsFixed(2)}
    (${percentage.toStringAsFixed(2)}%)''',
                radius: 80,
                titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              );
            },
          ),
          // borderData: FlBorderData(show: true),
          sectionsSpace: 5,
          centerSpaceRadius: 90,
          startDegreeOffset: 0,
        ),
      ),
    );
  }
}

double calculateTotalCost(List<RecipeModel> recipes) {
  double totalCost = 0;
  for (var recipe in recipes) {
    totalCost += double.parse(recipe.totalcost);
  }
  return totalCost;
}
