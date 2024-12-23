import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/Screens/drawer.dart';
import 'package:hiremi/Screens/jobs.dart';
import 'package:hiremi/Screens/verified_home.dart';
import 'package:hiremi/classes/notification.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NotificationScreen> {
  List<customNotification> notifications = [
    customNotification(
        title: "Hey, Your Account is Verified.",
        body: "Now, you have access to explore Hiremi App Independently.",
        image: "assets/Notification.png",
        isRead: true),
    customNotification(
        title: "Hey, Your Account is Verified.",
        body: "Now, you have access to explore Hiremi App Independently.",
        image: "assets/Notification.png",
        isRead: false),
    customNotification(
        title: "Hey, Your Account is Verified.",
        body: "Now, you have access to explore Hiremi App Independently.",
        image: "assets/Notification.png",
        isRead: false),
    customNotification(
        title: "Hey, Your Account is Verified.",
        body: "Now, you have access to explore Hiremi App Independently.",
        image: "assets/Notification.png",
        isRead: false),
    customNotification(
        title: "Hey, Your Account is Verified.",
        body: "Now, you have access to explore Hiremi App Independently.",
        image: "assets/Notification.png",
        isRead: false),
    customNotification(
        title: "Hey, Your Account is Verified.",
        body: "Now, you have access to explore Hiremi App Independently.",
        image: "assets/Notification.png",
        isRead: false),
  ];
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('Notifications'),
          centerTitle: true,
          actions: [
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
                    Icons.notifications_outlined,
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
        ),
        body: SingleChildScrollView(
          child: notifications.isEmpty
              ? NoNotifiactions()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: notification.isRead
                              ? Colors.white
                              : Color.fromARGB(155, 15, 60, 201),
                          width: 1,
                        ),
                        color: notification.isRead
                            ? Colors.white
                            : Color.fromARGB(39, 106, 226, 220),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 15, 60, 201),
                            child: Image.asset("assets/Notification.png",
                                width: 20)),
                        title: Text(
                          notification.title,
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          notification.body,
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Color.fromARGB(255, 128, 128, 128)),
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}

class NoNotifiactions extends StatelessWidget {
  const NoNotifiactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/no_notifcations.png"),
            const SizedBox(height: 10),
            Text(
              "NNN: No New Notifications!, Please Explore Hiremi Application for a while.",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
