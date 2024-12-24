import 'package:flutter/material.dart';

class Featureditem {
  final String title;
  final String description;
  final String image;
  final LinearGradient gradient;
  final Function onTap;

  Featureditem({
    required this.title,
    required this.description,
    required this.image,
    required this.gradient,
    required this.onTap
  });
}
