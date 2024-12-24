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
            size: 24,
            color: Color.fromARGB(
                255, 15, 60, 201)), // Customize icon color if needed
        title: Text(
          widget.desc,
          style: const TextStyle(color: Colors.black), // Customize text style
        ),
        onTap: () {
          Navigator.pop(context);
        },
        trailing: const Icon(Icons.keyboard_arrow_right,
            color: Color.fromARGB(255, 22, 62, 200), size: 24),
      ),
    );
  }
}
