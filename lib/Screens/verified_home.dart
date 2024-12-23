import 'package:flutter/material.dart';
import 'package:hiremi/Screens/BottomNavigation.dart';
import 'package:hiremi/Screens/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hiremi/Screens/notificationsceen.dart';
import 'package:hiremi/widgets/Carouselitem.dart';
import 'package:hiremi/widgets/CarouselSliderfeatured.dart';
import 'package:hiremi/widgets/featured.dart';
import 'package:hiremi/widgets/jobsforyou.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showverified() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 1, 136, 234),
                  // borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 23.0, bottom: 20),
                  child: Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        "assets/images/verifiedimg.png",
                        width: 86,
                        height: 110,
                      ),
                      Spacer(),
                      SizedBox(
                          child: Text(
                        "Additional benefits are \n unlocked, Independently\n Explore Hiremi.",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Text(
                "Congratulations! ",
                style: TextStyle(
                    fontSize: 29, color: Color.fromARGB(255, 15, 16, 201)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You are now Verified .",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Image.asset(
                    "assets/images/verifiedsymbol.png",
                    width: 38,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your App ID",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    " 23458 73432",
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 136, 234),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: Color.fromARGB(255, 15, 60, 201),

                    side: BorderSide(color: Color.fromARGB(255, 1, 136, 234)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(68),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Continue")),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var Screen_width = MediaQuery.of(context).size.width;
    var Screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 60, 201),
        elevation: 0,
        title: const Text(
          'Hiremi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    onPressed: () {
                      // Navia
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 10,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: showverified,
              child: Container(
                  width: Screen_width,
                  height: Screen_height * 0.2,
                  color: Color.fromARGB(255, 15, 62, 201),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 209, 228, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: Screen_width * 0.05,
                          vertical: Screen_width * 0.07),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: Screen_width * 0.07),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Harsh Pawar",
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "App id :123456789",
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(right: Screen_width * 0.07),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 1),
                              child: Row(
                                children: [
                                  Icon(Icons.abc),
                                  Text(
                                    "Verified",
                                    style: TextStyle(color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            CarouselSliderfeatured(),
            Featuredwidgets(),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "Jobs For You",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            jobslider()
          ],
        ),
      ),
    );
  }
}
