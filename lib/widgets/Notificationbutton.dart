import 'package:flutter/material.dart';
import 'package:hiremi/Screens/notificationsceen.dart';

class Notificationbutton extends StatelessWidget {
  const Notificationbutton({
    super.key,
    required this.outlinecolor,
    required this.icon,
  });
  final Color outlinecolor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          onPressed: () {
            // Navia
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
          icon: Icon(icon, color: outlinecolor),
        ),
        Positioned(
          right: 12,
          top: 10,
          child: Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
