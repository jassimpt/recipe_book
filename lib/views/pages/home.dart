import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recipe_book/controllers/db_function_provider.dart';
import 'package:recipe_book/controllers/login_provider.dart';

import 'package:recipe_book/helpers/colors.dart';
import 'package:recipe_book/views/pages/create_screen.dart';
import 'package:recipe_book/views/pages/edit_screen.dart';
import 'package:recipe_book/views/pages/login_page.dart';
import 'package:recipe_book/views/pages/terms.dart';

import 'package:recipe_book/views/pages/tutorial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key, required this.savedusername});
  final String savedusername;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // String? userName;

  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false).loadUsername();
    Provider.of<FunctionProvider>(context, listen: false).loadrecipes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<LoginProvider>(context).loadUsername();
    // Provider.of<FunctionProvider>(context, listen: false).loadrecipes();
    Provider.of<FunctionProvider>(context).getAllRecipes();
    return SafeArea(
      child: Scaffold(
        endDrawer: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25), topLeft: Radius.circular(25)),
            child: Drawer(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Settings',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          backgroundColor: MaterialStatePropertyAll(boxgrey)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Terms(),
                        ));
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
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          backgroundColor: MaterialStatePropertyAll(boxgrey)),
                      onPressed: () {
                        logOut();
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
                  const SizedBox(
                    height: 50,
                  ),
                  const Center(
                      child: Text(
                    'Version 1.0.1',
                    style: TextStyle(fontSize: 15),
                  ))
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Provider.of<LoginProvider>(context).userName != null
                      ? Text(
                          Provider.of<LoginProvider>(context).userName!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: usernamegrey,
                          ),
                        )
                      : const Text('Error!!'),
                  Builder(builder: (context) {
                    return Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 3),
                                blurRadius: 8)
                          ]),
                      child: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: Image.asset(
                            'assets/images/menu.png',
                            height: 20,
                          )),
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
                      onChanged: (value) =>
                          Provider.of<FunctionProvider>(context, listen: false)
                              .filterRecipes(value),
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
                height: 20,
              ),
              Expanded(child: Consumer<FunctionProvider>(
                builder: (context, value, child) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: Provider.of<FunctionProvider>(context)
                        .foundrecipe
                        .length,
                    itemBuilder: (context, index) {
                      final data = Provider.of<FunctionProvider>(context)
                          .foundrecipe[index];
                      return recipecard(context, data, index);
                    },
                  );
                },
              )),
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
          builder: (context) => TutorialScreen(recipe: data),
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
                            builder: (context) => EditScreen(
                                description: data.description,
                                foodname: data.foodname,
                                index: index,
                                ingredients: data.ingredients,
                                totalcost: data.totalcost,
                                image: data.image),
                          ));
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
                          Provider.of<FunctionProvider>(context, listen: false)
                              .addtofavourites(data);
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
              offset: const Offset(22, -20),
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
                        : const AssetImage('assets/images/no-image.jpg')
                            as ImageProvider,
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
                    data.foodname,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    data.totalcost,
                    style: const TextStyle(
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
        confirmBtnText: 'Yes',
        cancelBtnText: 'No',
        cancelBtnTextStyle: const TextStyle(color: Colors.red),
        confirmBtnColor: Colors.green,
        onConfirmBtnTap: () {
          Provider.of<FunctionProvider>(context, listen: false)
              .deleteRecipe(index);
          // deleteRecipe(index);
          Navigator.pop(context);
        },
        customAsset: 'assets/images/deleting.gif');
  }

  logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }
}
