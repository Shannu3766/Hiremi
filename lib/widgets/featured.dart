import 'package:flutter/material.dart';
import 'package:hiremi/Screens/BottomNavigation.dart';
import 'package:hiremi/Screens/jobs.dart';
import 'package:hiremi/Screens/statusscreen.dart';
import 'package:hiremi/classes/featureditem.dart';
import 'package:hiremi/widgets/featureditemdesign.dart';

class Featuredwidgets extends StatelessWidget {
  const Featuredwidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Featureditem> items = [
      Featureditem(
          title: 'Ask Expert',
          description: 'Ask Anything Get Expert Guidance',
          image: "assets/images/featured_images/featured_1.png",
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 128, 185, 255),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 205, 227, 255),
              Color.fromARGB(179, 205, 227, 255)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          onTap: () {}),
      Featureditem(
          title: 'Internship',
          description: 'Gain Practical Experience',
          image: "assets/images/featured_images/featured_2.png",
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(128, 84, 255, 155),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(128, 170, 255, 205),
              Color.fromARGB(128, 170, 255, 205)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Jobs_Screen(
                index: 0,
              );
            }));
          }),
      Featureditem(
          title: 'Status',
          description: 'Gain Practical Experience',
          image: "assets/images/featured_images/featured_3.png",
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 249, 100, 102),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(204, 255, 195, 196),
              Color.fromARGB(179, 255, 201, 202)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Statusscreen();
            }));
          }),
      Featureditem(
          title: 'Fresher',
          description: 'Gain Practical Experience',
          image: "assets/images/featured_images/featured_4.png",
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 160, 88),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(204, 255, 208, 171),
              Color.fromARGB(204, 255, 208, 171)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Jobs_Screen(
                index: 1,
              );
            }));
          }),
      Featureditem(
          title: 'Hireme360',
          description: 'Gain Practical Experience',
          image: "assets/images/featured_images/featured_5.png",
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 222, 129),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 239, 192),
              Color.fromARGB(255, 255, 239, 192)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          onTap: () {}),
      Featureditem(
          title: 'Experience',
          description: 'Gain Practical Experience',
          image: "assets/images/featured_images/featured_6.png",
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 160, 138, 255),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 224, 217, 255),
              Color.fromARGB(204, 208, 196, 255)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Jobs_Screen(
                index: 2,
              );
            }));
          }),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 2, // Card aspect ratio
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return FeaturedItemDesign(item: items[index]);
            }),
      ),
    );
  }
}
