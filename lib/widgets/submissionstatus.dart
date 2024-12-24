import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/Screens/chatscreen.dart';
import 'package:hiremi/classes/jobstatus.dart';

class SubmissionStatus extends StatefulWidget {
  SubmissionStatus({super.key, required this.status});
  final jobstatus status;

  @override
  _SubmissionStatusState createState() => _SubmissionStatusState();
}

class _SubmissionStatusState extends State<SubmissionStatus> {
  bool isMessageExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    foregroundImage: Image.asset(widget.status.image).image,
                    radius: 20,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hiremi mentor Added a message",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    // Expandable Message Section
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: (widget.status.isread)
                                ? Color.fromARGB(255, 1, 116, 200)
                                : Colors.grey,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(
                                  "afsdknkadsf.....................................");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(widget.status.message),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isMessageExpanded = !isMessageExpanded;
                              });
                            },
                            child: Icon(
                              isMessageExpanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down_circle_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: isMessageExpanded ? 120 : 0,
                      child: isMessageExpanded
                          ? Column(
                              children: [
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ProgressStep(
                                      isCompleted: true,
                                      label: "Submit\nquery",
                                      stepNumber: 1,
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 3,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    ProgressStep(
                                      isCompleted: false,
                                      label: "Query\nReviewed",
                                      stepNumber: 2,
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 2,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    ProgressStep(
                                      isCompleted: false,
                                      label: "Meeting\nScheduled",
                                      stepNumber: 3,
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 1.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    ProgressStep(
                                      isCompleted: false,
                                      label: "Query\nResolved",
                                      stepNumber: 4,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(225, 211, 223, 231)),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: !isMessageExpanded
                      ? Text(
                          widget.status.statusmessage,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : null,
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom widget for progress steps
class ProgressStep extends StatelessWidget {
  final bool isCompleted;
  final int stepNumber;
  final String label;

  const ProgressStep({
    required this.isCompleted,
    required this.stepNumber,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted
                      ? Colors.transparent
                      : Color.fromARGB(255, 2, 116, 200),
                ),
                color: isCompleted
                    ? Color.fromARGB(255, 2, 116, 200)
                    : Colors.white,
              ),
              width: 28,
              height: 28,
              child: Center(
                child: isCompleted
                    ? Icon(Icons.check, color: Colors.white, size: 12)
                    : Text(
                        stepNumber.toString(),
                        style: TextStyle(
                          color: isCompleted
                              ? Colors.white
                              : Color.fromARGB(255, 2, 116, 200),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          label,
          maxLines: 2,
          style: TextStyle(
            fontSize: 10,
            color:
                isCompleted ? Colors.black : Color.fromARGB(255, 2, 116, 200),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
