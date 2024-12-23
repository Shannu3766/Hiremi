import 'package:flutter/material.dart';
import 'package:hiremi/classes/jobitem.dart';

class Jobitemdesign extends StatelessWidget {
  const Jobitemdesign({super.key, required this.item, required this.color});
  final jobitem item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                item.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    Text(
                      item.location,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text(
                item.subtitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
              Text(
                item.position,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
              Text(
                item.role,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
              Text(
                item.mode,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Apply Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${item.salary}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Ensure you specify the color
                      ),
                    ),
                    const TextSpan(
                      text: "/month",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black, // Ensure you specify the color
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }
}
