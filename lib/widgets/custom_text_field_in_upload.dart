import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:recipe_book/colors/colors.dart';

class CustomTextFildInUpload extends StatelessWidget {
  const CustomTextFildInUpload({Key? key, this.maxLines = 1, this.radius = 10})
      : super(key: key);

  final int maxLines;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // You can adjust the width as needed
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              // incredient name
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: 'ingredient',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(color: outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(color: outline),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              // quantity
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: 'quantity',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(color: outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(color: outline),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              // price
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: 'price',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(color: outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(color: outline),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
