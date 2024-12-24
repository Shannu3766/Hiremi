import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/Screens/jobscreen.dart';
import 'package:hiremi/classes/jobwidget.dart';

class Jobscreenitem extends StatelessWidget {
  const Jobscreenitem({super.key, required this.job});
  final jobclass job;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(job.image),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    job.company,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on, size: 8, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                job.location,
                style: GoogleFonts.poppins(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.currency_rupee, size: 8, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                "₹${job.minpay} - ₹${job.maxpay}",
                style: GoogleFonts.poppins(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Traititem(
                color: const Color(0xFFFFEEE5),
                trait: job.position,
                image: "assets/icons/shop.png",
              ),
              Traititem(
                color: const Color(0xFFFFF6E5),
                trait: job.mode,
                image: "assets/icons/alarm.png",
              ),
              Traititem(
                color: const Color(0xFFFFE5EE),
                trait: job.Experience,
                image: "assets/icons/work.png",
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Colors.grey, thickness: 1),
          // const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/target.png"),
                  const SizedBox(width: 6),
                  Text(
                    "Actively Recruiting",
                    style: GoogleFonts.poppins(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 52, 173, 120)),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset("assets/icons/avg_pace.png"),
              SizedBox(width: 4),
              Text(
                "${job.lastrecruiting}",
                style: GoogleFonts.poppins(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Jobscreen(job: job);
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 15, 60, 201),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            child: Text(
              "Apply Now",
              style: GoogleFonts.poppins(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class Traititem extends StatelessWidget {
  const Traititem({
    super.key,
    required this.color,
    required this.trait,
    required this.image,
  });
  final Color color;
  final String trait;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 8,
          ),
          const SizedBox(width: 4),
          Text(
            trait,
            style: GoogleFonts.poppins(
              fontSize: 8,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
