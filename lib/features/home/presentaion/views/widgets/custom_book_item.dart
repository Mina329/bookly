import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
          image: const DecorationImage(
              image: NetworkImage(
                  "https://avatars.githubusercontent.com/u/96777964?v=4"),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}