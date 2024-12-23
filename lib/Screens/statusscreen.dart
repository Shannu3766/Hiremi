import 'package:flutter/material.dart';
import 'package:hiremi/Screens/drawer.dart';
import 'package:hiremi/classes/jobstatus.dart';
import 'package:hiremi/widgets/submissionstatus.dart';

class Statusscreen extends StatefulWidget {
  const Statusscreen({super.key});

  @override
  State<Statusscreen> createState() => _StatusscreenState();
}

class _StatusscreenState extends State<Statusscreen> {
  List<jobstatus> messages = [
    jobstatus(
        image: "assets/jobstatusprofile_1.png",
        status:
            "Thank you for your submission! Our team will review your query shortly. ",
        level: 1,
        message:
            "Thank you for your submission! Our team will review your query shortly.",
        statusmessage: "Application Sent",
        isread: true),
    jobstatus(
        image: "assets/jobstatusprofile_2.png",
        status:
            "Your query has been analyzed. A meeting has been scheduled and details. ",
        level: 1,
        message:
            "Thank you for your submission! Our team will review your query shortly.",
        statusmessage: "Query Analysed",
        isread: false),
    jobstatus(
        image: "assets/jobstatusprofile_3.png",
        status: "“Looks perfect, send it for technical review tomorrow!” ",
        level: 1,
        message:
            "Thank you for your submission! Our team will review your query shortly.",
        statusmessage: "Meeting scheduled",
        isread: false),
    jobstatus(
        image: "assets/jobstatusprofile_4.png",
        status: "“Looks perfect, send it for technical review tomorrow!”",
        level: 1,
        message:
            "Thank you for your submission! Our team will review your query shortly.",
        statusmessage: "Query has been resolved",
        isread: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Status"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return SubmissionStatus(status: messages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
