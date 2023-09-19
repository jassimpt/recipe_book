import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/colors/colors.dart';
import 'package:recipe_book/widgets/custom_text_field_in_upload.dart';

class editscreen extends StatefulWidget {
  const editscreen({Key? key}) : super(key: key);

  @override
  _editscreenState createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) => addingredients(index),
                ),
                ingredientsbutton(),
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
                Container(
                  height: 60,
                  width: 385,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {},
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
        // add image to hive
      },
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
    );
  }

  addingredients(int index) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: CustomTextFildInUpload(
        radius: 20,
      ),
    );
  }

  ingredientsbutton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          setState(() {});
          ingredients.add(addingredients(1));
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: usernamegrey),
              borderRadius: BorderRadius.circular(25)),
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.add),
            Text(
              'Ingredients',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
      ),
    );
  }
}
