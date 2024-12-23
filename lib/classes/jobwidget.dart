import 'package:flutter/material.dart';

class jobclass {
  final String title;
  final String company;
  final String mode;
  final String minpay;
  final String maxpay;
  final String Experience;
  final String position;
  final bool isactivelyrecruiting;
  final String lastrecruiting;
  final String image;
  final String location;

  const jobclass({
    required this.title,
    required this.company,
    required this.mode,
    required this.minpay,
    required this.maxpay,
    required this.Experience,
    required this.position,
    required this.isactivelyrecruiting,
    required this.lastrecruiting,
    required this.image,
    required this.location,
  });
}
