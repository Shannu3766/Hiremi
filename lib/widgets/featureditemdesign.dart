import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/classes/featureditem.dart';

class FeaturedItemDesign extends StatelessWidget {
  final Featureditem item;
  FeaturedItemDesign({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: item.gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          item.onTap();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(
                      item.description,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 10,
                child: Image.asset(
                  item.image,
                  width: 70,

                  fit: BoxFit.contain, // Ensures the image scales properly
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
