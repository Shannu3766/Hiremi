import 'package:flutter/material.dart';
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    job.company,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                job.location,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.currency_rupee, size: 16, color: Colors.grey),
              Text(
                "₹${job.minpay} - ₹${job.maxpay}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Traititem(
                color: const Color(0xFFFFF6E5),
                trait: job.mode,
                icon: const Icon(Icons.work, size: 16),
              ),
              Traititem(
                color: const Color(0xFFFFEEE5),
                trait: job.position,
                icon: const Icon(Icons.access_time, size: 16),
              ),
              Traititem(
                color: const Color(0xFFFFE5EE),
                trait: job.Experience,
                icon: const Icon(Icons.business_center, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Colors.grey, thickness: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    job.isactivelyrecruiting
                        ? Icons.check_circle
                        : Icons.cancel,
                    size: 16,
                    color: job.isactivelyrecruiting ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    job.isactivelyrecruiting
                        ? "Actively Recruiting"
                        : "Not Recruiting",
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          job.isactivelyrecruiting ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              Text(
                "${job.lastrecruiting} ago",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
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
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            child: const Text(
              "Apply Now",
              style: TextStyle(color: Colors.white, fontSize: 14),
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
    required this.icon,
  });
  final Color color;
  final String trait;
  final Icon icon;

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
          icon,
          const SizedBox(width: 4),
          Text(
            trait,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
