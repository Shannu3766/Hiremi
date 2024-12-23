import 'package:flutter/material.dart';
import 'package:hiremi/classes/featureditem.dart';

// class Featureditemdesign extends StatelessWidget {
//   final Featureditem item;

//   const Featureditemdesign({Key? key, required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: item.gradient,
//       ),
//       child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     item.title,
//                     maxLines: 2,
//                     style: TextStyle(fontSize: 2),
//                   ),
//                   Text(item.description,
//                       maxLines: 2, style: TextStyle(fontSize: 2)),
//                 ],
//               ),
//               Image.asset(
//                 item.image,
//                 fit: BoxFit.cover,
//               ),
//             ],
//           )),
//     );
//   }
// }
class FeaturedItemDesign extends StatelessWidget {
  final Featureditem item;

  const FeaturedItemDesign({Key? key, required this.item}) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  child: Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 10,
              child: Image.asset(
                item.image,
                width: 80,

                fit: BoxFit.contain, // Ensures the image scales properly
              ),
            ),
          ],
        ),
      ),
    );
  }
}
