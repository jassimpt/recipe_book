import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recipe_book/db/functions/db_functions.dart';
import 'package:recipe_book/db/model/data_model.dart';
import 'package:recipe_book/helpers/colors.dart';
import 'package:recipe_book/pages/createscreen.dart';
import 'package:recipe_book/pages/editscreen.dart';
import 'package:recipe_book/pages/terms.dart';
import 'package:recipe_book/pages/tutorialpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    getAllRecipes();
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Settings',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStatePropertyAll(boxgrey)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Terms(),
                    ));
                    // totalcost button function
                  },
                  child: const Text(
                    'Terms and conditions',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStatePropertyAll(boxgrey)),
                  onPressed: () {
                    // totalcost button function
                  },
                  child: const Text(
                    'Help',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStatePropertyAll(boxgrey)),
                  onPressed: () {
                    // totalcost button function
                  },
                  child: const Text(
                    'About our app',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStatePropertyAll(boxgrey)),
                  onPressed: () {
                    SystemNavigator.pop();
                    // totalcost button function
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                'Version 1.0.1',
                style: TextStyle(fontSize: 15),
              ))
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Roberta Anny ', // username
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: usernamegrey,
                    ),
                  ),
                  Builder(builder: (context) {
                    return Container(
                      child: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: Image.asset(
                            'assets/images/menu.png',
                            height: 20,
                          )),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 3),
                                blurRadius: 8)
                          ]),
                    );
                  })
                ],
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      // Search Field
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        hintText: 'Search your item',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Createscreen(),
                            ));
                      },
                      icon: Image.asset('assets/icons/produt_add.png')),
                ],
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => tutorialscreen(recipe: data),
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
                            builder: (context) => editscreen(
                                description: data.description,
                                foodname: data.foodname,
                                index: index,
                                ingredients: data.ingredients,
                                totalcost: data.totalcost,
                                image: data.image),
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
                            deleterecipe(index, context);
                          },
                          icon: Image.asset(
                            'assets/icons/delete.png',
                            height: 24,
                          )),
                      IconButton(
                        onPressed: () {
                          addtofavourites(data);
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
                  child: Image(
                    image: data.image != null
                        ? FileImage(File(data.image!))
                        : AssetImage('assets/image/food.png') as ImageProvider,
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

  deleterecipe(index, context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        text: 'Do yo want to delete',
        confirmBtnText: 'Yes',
        cancelBtnText: 'No',
        cancelBtnTextStyle: TextStyle(color: Colors.red),
        confirmBtnColor: Colors.green,
        onConfirmBtnTap: () {
          deleteRecipe(index);
          Navigator.pop(context);
        },
        customAsset: 'assets/images/deleting.gif');
  }
}
