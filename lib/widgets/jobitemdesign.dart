import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                style: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 8,
                    ),
                    Text(
                      item.location,
                      style: GoogleFonts.inter(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
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
                style: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromARGB(255, 94, 97, 106),
                ),
              ),
              Text(
                item.position,
                style: GoogleFonts.notoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 143, 146, 152)),
                textAlign: TextAlign.left,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromARGB(255, 94, 97, 106),
                ),
              ),
              Text(
                item.role,
                style: GoogleFonts.notoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 143, 146, 152)),
                textAlign: TextAlign.left,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromARGB(255, 94, 97, 106),
                ),
              ),
              Text(
                item.mode,
                style: GoogleFonts.notoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 143, 146, 152)),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 15, 60, 201),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Apply Now',
                  style: GoogleFonts.notoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
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
