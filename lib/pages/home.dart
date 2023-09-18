import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Roberta Anny ',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 164, 163, 163)),
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
              TextFormField(
                // Search Field
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  hintText: 'Search your item',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return OverflowingImageContainer(); // Use the new widget here
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OverflowingImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow overflowing content
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipOval(
            child: Container(
              width: 150.0, // Adjust the size as needed
              height: 150.0, // Adjust the size as needed
              color: Colors.transparent, // Transparent background
            ),
          ),
        ),
        Positioned(
          top: -40, // Adjust this value to control the overflow amount
          child: Container(
            width: 120, // Adjust the size as needed
            height: 120, // Adjust the size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/food.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
