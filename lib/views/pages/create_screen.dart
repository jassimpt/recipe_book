import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/controllers/Images_provider.dart';

import 'package:recipe_book/controllers/noti_function_provider.dart';
import 'package:recipe_book/controllers/db_function_provider.dart';
import 'package:recipe_book/models/data_model.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({
    Key? key,
  }) : super(key: key);

  @override
  _CreatescreenState createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  bool isFieldFocused = false;

  final _foodnameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _totalCostController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
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
                    height: 15,
                  ),
                  const Text(
                    'Create Recipe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  addcoverphoto(),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                    controller: _foodnameController,
                    decoration: InputDecoration(
                      hintText: 'Food Name',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isFieldFocused ? Colors.red : Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                    controller: _ingredientsController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        hintText: 'Enter all ingredients with comma seperated',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                    controller: _descriptionController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'How to Prepare This?'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Total cost',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    keyboardType: TextInputType.number,
                    controller: _totalCostController,
                    decoration: const InputDecoration(
                        hintText: 'Enter total cost for this recipe',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: 385,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        addrecipe();

                        Provider.of<NotificationProvider>(context,
                                listen: false)
                            .addNotification();
                      },
                      child: const Text(
                        'Add my recipe',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addcoverphoto() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/icons/gallery.png',
                    height: 40,
                  ),
                  title: const Text('Gallery'),
                  onTap: () {
                    Provider.of<ImagesProvider>(context, listen: false)
                        .imagePicker(source: ImageSource.gallery);

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/camera.png',
                    height: 40,
                  ),
                  title: const Text('Camera'),
                  onTap: () {
                    Provider.of<ImagesProvider>(context, listen: false)
                        .imagePicker(source: ImageSource.camera);

                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    Provider.of<ImagesProvider>(context).selectedimage != null
                        ? FileImage(
                            Provider.of<ImagesProvider>(context).selectedimage!,
                          )
                        : const AssetImage('assets/images/no-image.jpg')
                            as ImageProvider,
                fit: BoxFit.cover)),
        child: DottedBorder(
          dashPattern: const [15, 5],
          color: Colors.grey,
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          child: const SizedBox(
            width: double.infinity,
            height: 160,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.photo,
                    size: 65,
                    color: Colors.grey,
                  ),
                  Text(
                    'Add cover photo',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text('up to 12 mb')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addrecipe() async {
    if (formkey.currentState!.validate()) {
      final foodname = _foodnameController.text.trim();
      final ingredients = _ingredientsController.text.trim();
      final totalcost = _totalCostController.text.trim();
      final description = _descriptionController.text.trim();

      if (foodname.isEmpty ||
          description.isEmpty ||
          ingredients.isEmpty ||
          totalcost.isEmpty) {
        return;
      }

      final isDuplicate = Provider.of<FunctionProvider>(context, listen: false)
          .recipeList
          .any((recipe) => recipe.foodname == foodname);
      if (isDuplicate) {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
              title: 'Oops!!',
              message: 'Recipe with same name exists',
              contentType: ContentType.failure),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }

      final recipe = RecipeModel(
          image: Provider.of<ImagesProvider>(context, listen: false)
              .selectedimage
              ?.path,
          foodname: foodname,
          ingredients: ingredients,
          totalcost: totalcost,
          description: description);

      Provider.of<FunctionProvider>(context, listen: false).addRecipe(recipe);

      Navigator.pop(context);

      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: 'Oh Hey!!',
            message: 'You successfully added your magic recipe',
            contentType: ContentType.success),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
