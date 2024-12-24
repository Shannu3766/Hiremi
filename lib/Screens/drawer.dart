import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/widgets/draweritem.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.7;

    return Drawer(
      child: Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 15, 60, 201),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenWidth * 0.07,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.07),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Harsh Pawar",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            "App id: 123456789",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: EdgeInsets.only(right: screenWidth * 0.07),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 7,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Verified",
                              style: GoogleFonts.poppins(
                                  fontSize: 7,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 52, 173, 120)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 15, 60, 201),
              // onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blueAccent),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Edit  Your Profile",
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: screenWidth * 0.05,
            endIndent: screenWidth * 0.05,
          ),
          DrawerItem(desc: "Your Profile", icon: Icons.person),
          DrawerItem(desc: "Settings", icon: Icons.settings),
          DrawerItem(desc: "About App", icon: Icons.assignment),
          DrawerItem(desc: "Help and Support", icon: Icons.quickreply),
        ],
      ),
    );
  }
}
