import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hiremi/widgets/Carouselitem.dart';

class CarouselSliderfeatured extends StatelessWidget {
  final List<Carouselitem> items = [
    const Carouselitem(
      title: 'Hiremi 360',
      image: 'assets/images/slider_1.png',
      description: 'Career ka backup,\n,Success ka gaurantee',
    ),
    const Carouselitem(
      title: 'Title 2',
      image: 'assets/images/slider_1.png',
      description: 'Description for Title 2',
    ),
    const Carouselitem(
      title: 'Title 3',
      image: 'assets/images/slider_1.png',
      description: 'Description for Title 3',
    ),
    const Carouselitem(
      title: 'Title 4',
      image: 'assets/images/slider_1.png',
      description: 'Career ka backup,\n,Success ka gaurantee',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        enlargeCenterPage:
            false, // Disable centering effect for a cleaner full-width design
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0, // Each item takes up the full width
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: item, // Directly use the custom Carouselitem widget
            );
          },
        );
      }).toList(),
    );
  }
}
