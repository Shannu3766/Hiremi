import 'package:flutter/material.dart';
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
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 209, 228, 255),
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Harsh Pawar",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "App id: 123456789",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(right: screenWidth * 0.07),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Verified",
                              style: TextStyle(color: Colors.green),
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
              backgroundColor: Colors.blue,
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
              style: TextStyle(color: Colors.white),
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
          DrawerItem(desc: "About App", icon: Icons.help),
          DrawerItem(desc: "Help and Support", icon: Icons.logout),
        ],
      ),
    );
  }
}
