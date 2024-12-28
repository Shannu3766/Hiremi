import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationsScreen extends StatefulWidget {
  @override
  _CongratulationsScreenState createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _secondController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _secondController.forward();
        }
      });

    _secondController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _secondController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedText(
      String text, AnimationController controller, bool isSecond) {
    final animations = text.split('').asMap().entries.map((entry) {
      int index = entry.key;
      return {
        'offset': Tween<Offset>(
          begin: Offset(0, 0.5),
          end: Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            index / text.length,
            (index + 4) / text.length > 1.0 ? 1.0 : (index + 4) / text.length,
            curve: Curves.easeOut,
          ),
        )),
        'fade': Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            index / text.length,
            (index + 4) / text.length > 1.0 ? 1.0 : (index + 4) / text.length,
            curve: Curves.easeIn,
          ),
        )),
      };
    }).toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: text.split('').asMap().entries.map((entry) {
        int index = entry.key;
        String letter = entry.value;
        return FadeTransition(
            opacity: animations[index]['fade'] as Animation<double>,
            child: SlideTransition(
                position: animations[index]['offset'] as Animation<Offset>,
                child: Text(letter,
                    style: isSecond
                        ? GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w400)
                        : GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 29,
                            color: Color.fromARGB(255, 15, 16, 201)))));
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAnimatedText("Congratulations", _controller, false),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimatedText(
                  "Your account has been created", _secondController, true),
              Icon(
                Icons.verified,
                color: Color.fromARGB(255, 15, 16, 201),
                size: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
