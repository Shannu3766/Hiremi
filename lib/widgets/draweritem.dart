import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({
    super.key,
    required this.desc,
    required this.icon,
  });

  final IconData icon;
  final String desc;

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(
          vertical: 4.0, horizontal: 0), // Adjust spacing if necessary
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        leading: Icon(widget.icon,
            color: Colors.black), // Customize icon color if needed
        title: Text(
          widget.desc,
          style: const TextStyle(color: Colors.black), // Customize text style
        ),
        onTap: () {
          // Update the state of the app
          // Then close the drawer
          Navigator.pop(context);
        },
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }
}
