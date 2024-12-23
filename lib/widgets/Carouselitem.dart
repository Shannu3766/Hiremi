import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carouselitem extends StatelessWidget {
  const Carouselitem(
      {super.key,
      required this.title,
      required this.image,
      required this.description});
  final String title;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // const SizedBox(width: 16),
            Image.asset(
              image,
              width: 100,
              // height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
