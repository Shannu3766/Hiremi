import 'package:flutter/material.dart';
import 'package:hiremi/Screens/jobs.dart';
import 'package:hiremi/Screens/statusscreen.dart';
import 'package:hiremi/classes/featureditem.dart';
import 'package:hiremi/widgets/featureditemdesign.dart';
import 'package:flutter/material.dart';
import 'package:hiremi/classes/featureditem.dart';
import 'package:hiremi/widgets/featureditemdesign.dart';
import 'package:flutter/material.dart';
import 'package:hiremi/classes/featureditem.dart';
import 'package:hiremi/widgets/featureditemdesign.dart';

class Featuredwidgets extends StatefulWidget {
  const Featuredwidgets({super.key});

  @override
  _FeaturedwidgetsState createState() => _FeaturedwidgetsState();
}

class _FeaturedwidgetsState extends State<Featuredwidgets>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<AnimationController> _lineControllers = [];
  final int columns = 2; // Number of columns in the grid

  @override
  void initState() {
    super.initState();

    // Initialize controllers for each line
    int totalLines = (6 / columns).ceil(); // Assuming 6 items in the grid
    _lineControllers = List.generate(totalLines, (index) {
      return AnimationController(
        duration:
            const Duration(seconds: 1), // Animation duration for each line
        vsync: this,
      );
    });

    // Start animations sequentially
    _startLineAnimations();
  }

  Future<void> _startLineAnimations() async {
    for (var controller in _lineControllers) {
      controller.forward();
      await Future.delayed(
          const Duration(seconds: 2)); // Delay before starting the next line
    }
  }

  @override
  void dispose() {
    for (var controller in _lineControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns, // Number of columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 3 / 2, // Card aspect ratio
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            // Determine which line the item belongs to
            int lineIndex = index ~/ columns;

            final animation = TweenSequence<Offset>([
              // Stage 1: Move from the initial offset to the midpoint position
              TweenSequenceItem(
                tween: Tween<Offset>(
                  begin: Offset(index % 2 == 0 ? -1 : 1, 0), // Start position
                  end: Offset(
                      index % 2 == 0 ? 0.2 : -0.2, 0), // Midpoint position
                ).chain(CurveTween(curve: Curves.easeOut)), // Smooth transition
                weight: 40, // Weight for this stage
              ),
              // Stage 2: Move from the midpoint position to the collision point
              TweenSequenceItem(
                tween: Tween<Offset>(
                  begin: Offset(
                      index % 2 == 0 ? 0.2 : -0.2, 0), // Midpoint position
                  end: Offset(0, 0), // Collision point (center)
                ).chain(
                    CurveTween(curve: Curves.easeInOut)), // Smooth transition
                weight: 30, // Weight for this stage
              ),
              // Stage 3: Move from the collision point back to the midpoint position
              // TweenSequenceItem(
              //   tween: Tween<Offset>(
              //     begin: Offset(0, 0), // Collision point (center)
              //     end: Offset(
              //         index % 2 == 0 ? -0.2 : 0.2, 0), // Midpoint position
              //   ).chain(
              //       CurveTween(curve: Curves.easeInOut)), // Smooth transition
              //   weight: 20, // Weight for this stage
              // ),
              // // Stage 4: Move from the midpoint position to the final position
              // TweenSequenceItem(
              //   tween: Tween<Offset>(
              //     begin: Offset(
              //         index % 2 == 0 ? -0.2 : 0.2, 0), // Midpoint position
              //     end: Offset(0, 0), // Final position
              //   ).chain(CurveTween(curve: Curves.easeIn)), // Smooth transition
              //   weight: 10, // Weight for this stage
              // ),
            ]).animate(CurvedAnimation(
              parent: _lineControllers[lineIndex],
              curve: Curves.linear, // Even timing for the sequence
            ));

            return AnimatedBuilder(
              animation: _lineControllers[lineIndex],
              builder: (context, child) {
                return SlideTransition(
                  position: animation,
                  child: child,
                );
              },
              child: FeaturedItemDesign(item: items[index]),
            );
          },
        ),
      ),
    );
  }
}
