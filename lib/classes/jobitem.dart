import 'package:flutter/material.dart';

class jobitem {
  final String title;
  final String subtitle;
  final String location;
  final String role;
  final String position;
  final String mode;
  final String salary;

  const jobitem(
      {required this.title,
      required this.subtitle,
      required this.location,
      required this.role,
      required this.position,
      required this.mode,
      required this.salary});
}
