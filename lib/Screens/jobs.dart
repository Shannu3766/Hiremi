import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/Screens/drawer.dart';
import 'package:hiremi/classes/jobwidget.dart';
import 'package:hiremi/widgets/Notificationbutton.dart';
import 'package:hiremi/widgets/jobscreenitem.dart';
import 'package:flutter/material.dart';
import 'package:hiremi/Screens/drawer.dart';
import 'package:hiremi/classes/jobwidget.dart';
import 'package:hiremi/widgets/jobscreenitem.dart';
import 'package:gif/gif.dart';

class Jobs_Screen extends StatefulWidget {
  const Jobs_Screen({super.key, required this.index});
  final int index;
  @override
  State<Jobs_Screen> createState() => _Jobs_ScreenState();
}

class _Jobs_ScreenState extends State<Jobs_Screen>
    with TickerProviderStateMixin {
  late final GifController gifController;
  List<String> jobcategories = ["Internships", "Freshers", "Experienced"];
  List<jobclass> filteredjobs = [];
  List<String> typeofjob = [
    "All",
    "Product Manager",
    "Software Engineer",
    "Data Analyst",
    "Business Analyst",
    "UI/UX Designer",
    "Graphic Designer",
    "Digital Marketing",
    "Content Writer",
    "HR",
    "Finance",
    "Operations",
    "Sales",
    "Marketing",
    "Customer Support",
    "Others"
  ];

  List<jobclass> joblist = [
    const jobclass(
      title: "Human Resource Intern",
      company: "Hiremi",
      mode: "Internships",
      minpay: "2,000",
      maxpay: "15,000",
      Experience: "1 Year Exp",
      position: "Remote",
      isactivelyrecruiting: true,
      lastrecruiting: "6 days ago",
      image: "assets/images/company_icon.png",
      location: "Bhopal - Madhya Pradesh",
    ),
    const jobclass(
      title: "Social Media Intern",
      company: "CRTD Techologies",
      mode: "Internships",
      minpay: "2,000",
      maxpay: "15,000",
      Experience: "1 Year Exp",
      position: "Remote",
      isactivelyrecruiting: true,
      lastrecruiting: "6 days ago",
      image: "assets/images/company_icon.png",
      location: "Bhopal - Madhya Pradesh",
    ),
    const jobclass(
      title: "Human Resource",
      company: "Hiremi",
      mode: "Freshers",
      minpay: "2,000",
      maxpay: "15,000",
      Experience: "1 Year Exp",
      position: "Remote",
      isactivelyrecruiting: true,
      lastrecruiting: "6 days ago",
      image: "assets/images/company_icon.png",
      location: "Bhopal - Madhya Pradesh",
    ),
    const jobclass(
      title: "Social Media",
      company: "CRTD Techologies",
      mode: "Freshers",
      minpay: "2,000",
      maxpay: "15,000",
      Experience: "1 Year Exp",
      position: "Remote",
      isactivelyrecruiting: true,
      lastrecruiting: "6 days ago",
      image: "assets/images/company_icon.png",
      location: "Bhopal - Madhya Pradesh",
    ),
    const jobclass(
      title: "Head Human Resource",
      company: "Hiremi",
      mode: "Experienced",
      minpay: "2,000",
      maxpay: "15,000",
      Experience: "5 Year Exp",
      position: "Remote",
      isactivelyrecruiting: true,
      lastrecruiting: "6 days ago",
      image: "assets/images/company_icon.png",
      location: "Bhopal - Madhya Pradesh",
    ),
    const jobclass(
      title: "Social Media",
      company: "CRTD Techologies",
      mode: "Experienced",
      minpay: "2,000",
      maxpay: "15,000",
      Experience: "5 Year Exp",
      position: "Remote",
      isactivelyrecruiting: true,
      lastrecruiting: "6 days ago",
      image: "assets/images/company_icon.png",
      location: "Bhopal - Madhya Pradesh",
    ),
  ];

  void popup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            content: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Make your profile stand out!",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Image.asset(
                    "assets/jobfinder.gif",
                    width: 246,
                  ),
                  Text(
                    "Add your projects and experiences to increase your visibility and get noticed.",
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 16, 60, 201),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: () {},
                      child: Text(
                        "Add Projects and experience",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ));
      },
    );
  }

  List<jobclass> get joblistfiltered {
    return joblist.where((job) {
      if (selectedjobindex == 0) {
        return job.mode == "Internships";
      } else if (selectedjobindex == 1) {
        return job.mode == "Freshers";
      } else {
        return job.mode == "Experienced";
      }
    }).toList();
  }

  var selectedjobindex;
  int selectedtypeofjobindex = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    gifController = GifController(vsync: this);
    selectedjobindex = widget.index;
    super.initState();
    filteredjobs = joblistfiltered;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 15, 60, 201),
          elevation: 0,
          title: Text(
            jobcategories[selectedjobindex],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Column(
              children: [
                Notificationbutton(
                  outlinecolor: Colors.black,
                  icon: Icons.notification_add,
                )
              ],
            )
          ]),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal List of Job Categories
            SizedBox(
              width: screenwidth,
              height: screenheight * 0.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobcategories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedjobindex;
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color.fromARGB(255, 15, 60, 201)
                          : const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedjobindex = index;
                            filteredjobs = joblistfiltered;
                            _scrollController.animateTo(
                              0.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              jobcategories[index],
                              style: GoogleFonts.inter(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            filteredjobs.length == 0
                ? Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/nojobs.png"),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hiremi’s Recruiters are planning for new jobs and roles, please wait for few days",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset:
                                        const Offset(0, 2), // Shadow position
                                  ),
                                ],
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Search",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 15, 60, 201),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.tune, color: Colors.white),
                              onPressed: () {
                                // Add your filter functionality here
                                popup();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenwidth,
                        height: screenheight * 0.08,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: typeofjob.length,
                          itemBuilder: (context, index) {
                            final isSelected = index == selectedtypeofjobindex;
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedtypeofjobindex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Color.fromARGB(255, 15, 60, 201)
                                        : const Color.fromARGB(
                                            255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      typeofjob[index],
                                      style: GoogleFonts.inter(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                      Header(
                          title:
                              "Available internships (${filteredjobs.length})"),
                      ListView.builder(
                        // controller: _scrollController,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: filteredjobs.length,
                        itemBuilder: (context, index) {
                          final job = filteredjobs[index];
                          return Jobscreenitem(job: job);
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
