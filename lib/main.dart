import 'package:flutter/material.dart';
import 'package:hiremi/Screens/BottomNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _circleAnimation = Tween<double>(begin: 0.1, end: 3.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(Duration(seconds: 1), () {
      _controller.forward().then((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Navigation(currentindex: 0)),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: screenWidth / 2,
            top: screenHeight / 2,
            child: AnimatedBuilder(
              animation: _circleAnimation,
              builder: (context, child) {
                final size = screenHeight * _circleAnimation.value;
                return Transform.translate(
                  offset: Offset(-size / 2, -size / 2),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 15, 60, 201),
                      shape: BoxShape.circle,
                    ),
                    child: _circleAnimation.value <= 0.2
                        ? Center(
                            child: Container(
                              width:
                                  150, // Increased container size for spacing
                              height: 150,
                              child: Stack(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      backgroundColor: Colors.white,
                                      color: Color.fromARGB(255, 16, 60, 201),
                                    ),
                                  ),
                                  SizedBox(height: 20), // Creates 20 pixels gap
                                  Image.asset(
                                    "assets/appicon.png",
                                    width: 75,
                                    height: 75,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
