import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hiremi/classes/jobitem.dart';
import 'package:hiremi/widgets/jobitemdesign.dart';

class jobslider extends StatelessWidget {
  final List<jobitem> items = [
    jobitem(
        title: 'Motion Designer',
        subtitle: 'Pintrest Inc',
        location: 'Bangalore',
        role: 'Fulltime',
        position: 'Senior',
        mode: 'Remote',
        salary: "70k"),
    jobitem(
        title: 'Motion Designer',
        subtitle: 'Pintrest Inc',
        location: 'Bangalore',
        role: 'Fulltime',
        position: 'Senior',
        mode: 'Remote',
        salary: "70k"),
    jobitem(
        title: 'Motion Designer',
        subtitle: 'Pintrest Inc',
        location: 'Bangalore',
        role: 'Fulltime',
        position: 'Senior',
        mode: 'Remote',
        salary: "70k"),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        enlargeCenterPage:
            false, // Disable centering effect for a cleaner full-width design
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0, // Each item takes up the full width
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Jobitemdesign(
              item: item,
              color: items.indexOf(item) == 0
                  ? Color.fromARGB(255, 209, 228, 255)
                  : Colors.white,
            );
          },
        );
      }).toList(),
    );
  }
}
