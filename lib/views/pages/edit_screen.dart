import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:recipe_book/controllers/db_function_provider.dart';
import 'package:recipe_book/models/data_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {Key? key,
      required this.foodname,
      required this.ingredients,
      required this.description,
      required this.totalcost,
      required this.image,
      required this.index})
      : super(key: key);

  final String foodname;
  final String ingredients;
  final String description;
  final String totalcost;
  final dynamic image;
  final int index;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController foodnamecontroller = TextEditingController();
  final TextEditingController ingredientscontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController totalcostcontroller = TextEditingController();

  File? selectedimage;

  @override
  void initState() {
    foodnamecontroller.text = widget.foodname;
    ingredientscontroller.text = widget.ingredients;
    descriptioncontroller.text = widget.description;
    totalcostcontroller.text = widget.totalcost;
    selectedimage = widget.image != null ? File(widget.image) : null;
    super.initState();
  }

  bool isFieldFocused = false;
  List ingredients = [1];

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
                  'Update Recipe',
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
                  controller: foodnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Food Name',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFieldFocused ? Colors.red : Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
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
                  controller: ingredientscontroller,
                  maxLines: 5,
                  decoration: const InputDecoration(
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
                  controller: descriptioncontroller,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                  controller: totalcostcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter total cost for this recipe',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: 385,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.red)),
                      onPressed: () => updateRecipe(),
                      child: const Text(
                        'Update my recipe',
                        style: TextStyle(fontSize: 16),
                      )),
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
                  title: const Text('Gallery'),
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
                  title: const Text('Camera'),
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

  pickImage({required source}) async {
    final returnedimage = await ImagePicker().pickImage(source: source);

    setState(() {
      selectedimage = File(returnedimage!.path);
    });
  }

  updateRecipe() {
    final editedFoodname = foodnamecontroller.text.trim();
    final editedIngredients = ingredientscontroller.text.trim();
    final editedDescription = descriptioncontroller.text.trim();
    final editedTotalcost = totalcostcontroller.text.trim();
    final editedImage = selectedimage?.path;

    if (editedFoodname.isEmpty ||
        editedIngredients.isEmpty ||
        editedDescription.isEmpty ||
        editedTotalcost.isEmpty) {
      return;
    }
    final updatedRecipe = RecipeModel(
        foodname: editedFoodname,
        ingredients: editedIngredients,
        totalcost: editedTotalcost,
        description: editedDescription,
        image: editedImage);
    Provider.of<FunctionProvider>(context, listen: false)
        .editRecipe(widget.index, updatedRecipe);
    // editRecipe(widget.index, updatedRecipe);
    Navigator.pop(context);
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
          title: 'Wohoo!!',
          message: 'You successfully updated your magic recipe',
          contentType: ContentType.warning),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
