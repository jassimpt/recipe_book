import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/helpers/colors.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({Key? key}) : super(key: key);

  @override
  _CreatescreenState createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  bool isFieldFocused = false;

  final _foodnameconroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  final _ingredientscontroller = TextEditingController();
  final _totalcostcontroller = TextEditingController();

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
                  controller: _foodnameconroller,
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
                  controller: _ingredientscontroller,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Enter all ingredients',
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
                  controller: _descriptioncontroller,
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
                  controller: _totalcostcontroller,
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
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {
                        addrecipe();
                      },
                      child: const Text(
                        'Add my recipe',
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

  addrecipe() async {
    final foodname = _foodnameconroller.text.trim();
    final ingredients = _ingredientscontroller.text.trim();
    final totalcost = _totalcostcontroller.text.trim();
    final description = _descriptioncontroller.text.trim();

    if (foodname.isEmpty ||
        description.isEmpty ||
        ingredients.isEmpty ||
        totalcost.isEmpty) {
      return;
    }
    print('$foodname  $description');
  }
}
