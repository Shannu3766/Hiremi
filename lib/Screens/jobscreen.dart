import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/Screens/BottomNavigation.dart';
import 'package:hiremi/Screens/jobs.dart';
import 'package:hiremi/classes/jobwidget.dart';
import 'package:hiremi/classes/skill.dart';

class Jobscreen extends StatefulWidget {
  const Jobscreen({super.key, required this.job});
  final jobclass job;

  @override
  State<Jobscreen> createState() => _JobscreenState();
}

class _JobscreenState extends State<Jobscreen> {
  final String description =
      "As a Social Media Intern, your day-to-day responsibilities will include:";
  List<String> desc = [
    "Sourcing and Recruiting: Identify and recruit potential candidates through various channels.",
    "Screening Resumes: Evaluate candidate qualifications and skills.",
    "Conducting Interviews: Arrange and conduct interviews with potential candidates.",
    "Coordinating: Manage and coordinate with hiring managers to fulfill staffing needs.",
    "Maintaining Records: Keep accurate records of all candidates and their status in the hiring process"
  ];
  List<Skillsrequied> skills = [
    Skillsrequied(
        skillname: "Communication", color: Color.fromARGB(255, 255, 246, 249)),
    Skillsrequied(
        skillname: "Team Management",
        color: Color.fromARGB(255, 255, 238, 229)),
    Skillsrequied(
        skillname: "Tool Adoption", color: Color.fromARGB(255, 255, 229, 238)),
    Skillsrequied(
        skillname: "Work Independently",
        color: Color.fromARGB(255, 255, 229, 238))
  ];
  List<String> eligigbilty = [
    "Educational Qualification: BE/B.TECH/M.TECH/MCA/MBA/BCA/BSC/MSC or equivalent.",
    "Branch: All branches are eligible.",
    "Skills and Interests: Relevant skills and a keen interest in recruitment and talent acquisition."
  ];
  final String companydesc =
      "Hiremi is a platform connecting job seekers with employment opportunities. We strive to bridge the gap between talent and industry, fostering career growth and professional development.";

  void onapply(jobclass job) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.all(20),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/onapply.png"),
                  Text(
                    "Are you sure you want to apply for this opportunity?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(51, 15, 60, 201),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 15, 60, 201),
                              width: 1.0,
                            ),
                          ),
                          child: Text("Cancel",
                              style: GoogleFonts.workSans(
                                  fontSize: 12,
                                  color: const Color.fromARGB(255, 15, 60, 201),
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SizedBox(width: 10), // Optional spacing between buttons
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            confirmapply(job);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 15, 60, 201),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: Text("Yes,Apply",
                              style: GoogleFonts.workSans(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }

  void confirmapply(jobclass job) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.all(20),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/application_confirm.png"),
                  ),
                  Text(
                    "Congratulations !",
                    style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 15, 60, 201)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        " Thank you for applying at ",
                        style: GoogleFonts.poppins(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      // Text(job.company)
                      Image.asset(
                        "assets/hiremi.png",
                        width: 50,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Color.fromARGB(25, 15, 60, 201)),
                    child: Text(
                      "You’ve Successfully applied for the Interships",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Color.fromARGB(255, 15, 60, 201)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 11.0,
                        color: Colors.black,
                      ),
                      children: const [
                        TextSpan(text: 'If '),
                        TextSpan(
                          text: 'selected',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(text: ', you will be contacted via '),
                        TextSpan(
                          text: 'email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(text: ' with further details.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return Navigation(currentindex: 1);
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 60, 201),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text("Browse More Jobs",
                        style: GoogleFonts.workSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 10),
                  Text("Applied Date : 25/06/2024")
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.job.mode),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                jobheader(job: widget.job, onApply: onapply),
                const SizedBox(height: 20),
                Header(title: "Role :${widget.job.title}"),
                Row(
                  children: [
                    const Text(
                      "Location :",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(widget.job.position),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Salary :",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text("₹ ${widget.job.maxpay} per month"),
                  ],
                ),
                const Header(title: "About the role"),
                Text(description),
                listview(points: desc),
                Header(title: "Skills Required"),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: skills.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 3.0,
                    // mainAxisSpacing: 8.0,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (context, index) {
                    return skilltrait(
                      color: skills[index].color,
                      text: skills[index].skillname,
                    );
                  },
                ),
                Header(title: "Eligibility Criteria"),
                listview(points: eligigbilty),
                Header(title: "About ${widget.job.company} Company"),
                Text(companydesc),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
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
            style: const TextStyle(fontSize: 10),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Color.fromARGB(255, 15, 60, 201),
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class skilltrait extends StatelessWidget {
  const skilltrait({super.key, required this.color, required this.text});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(fontSize: 9),
      ),
    );
  }
}

class listview extends StatelessWidget {
  const listview({super.key, required this.points});
  final List<String> points;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: points.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "${index + 1}. ${points[index]}",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          );
        });
  }
}

class jobheader extends StatelessWidget {
  const jobheader({super.key, required this.job, required this.onApply});
  final jobclass job;
  final Function onApply;
  // fina

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
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
                    const Icon(Icons.currency_rupee,
                        size: 16, color: Colors.grey),
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
                          color: job.isactivelyrecruiting
                              ? Colors.green
                              : Colors.red,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          job.isactivelyrecruiting
                              ? "Actively Recruiting"
                              : "Not Recruiting",
                          style: TextStyle(
                            fontSize: 14,
                            color: job.isactivelyrecruiting
                                ? Colors.green
                                : Colors.red,
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
                    onApply(job);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  child: const Text(
                    "Apply Now",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
