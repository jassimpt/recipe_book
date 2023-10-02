import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_book/db/functions/db_functions.dart';
import 'package:recipe_book/db/model/data_model.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({Key? key}) : super(key: key);

  @override
  _CreatescreenState createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  bool isFieldFocused = false;

  final _foodnameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _totalCostController = TextEditingController();
  File? selectedimage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                  controller: _foodnameController,
                  // foodname
                  decoration: InputDecoration(
                    hintText: 'Food Name',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFieldFocused
                              ? Colors.red
                              : Colors
                                  .grey), // Change the border color based on focus
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  // Set the isFieldFocused state when the field is focused
                  onTap: () {
                    setState(() {
                      isFieldFocused = true;
                    });
                  },
                  // Reset the isFieldFocused state when focus is lost
                  onFieldSubmitted: (_) {
                    setState(() {
                      isFieldFocused = false;
                    });
                  },
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
                  controller: _ingredientsController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Enter all ingredients with comma seperated',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                  controller: _descriptionController,
                  // Description Field
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'How to Prepare This?'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Total cost',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _totalCostController,
                  decoration: InputDecoration(
                      hintText: 'Enter total cost for this recipe',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                  title: Text('Gallery'),
                  onTap: () {
                    pickImage(source: ImageSource.gallery);
                    //handle gallery
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/camera.png',
                    height: 40,
                  ),
                  title: Text('Camera'),
                  onTap: () {
                    pickImage(source: ImageSource.camera);
                    // Handle camera function
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
                image: selectedimage != null
                    ? FileImage(
                        selectedimage!,
                      )
                    : AssetImage('assets/images/no-image.jpg') as ImageProvider,
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

  pickImage({required source}) async {
    final returnedimage = await ImagePicker().pickImage(source: source);

    setState(() {
      selectedimage = File(returnedimage!.path);
    });
  }

  void addrecipe() async {
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

    final recipe = RecipeModel(
        image: selectedimage!.path,
        foodname: foodname,
        ingredients: ingredients,
        totalcost: totalcost,
        description: description);

    addRecipe(recipe);
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
