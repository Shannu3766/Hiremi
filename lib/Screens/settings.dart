import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/Screens/drawer.dart';
import 'package:hiremi/widgets/Notificationbutton.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        actions: [
          Column(
            children: [
              Notificationbutton(
                outlinecolor: Colors.black,
                icon: Icons.notifications,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [profile()],
      ),
    );
  }
}

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      "Harsh Pawar",
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 11),
                        Text(
                          "App ID: 0000-00000",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Container(
                  height: 26,
                  width: 74,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 15, 60, 201),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(right: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.verified,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Verified",
                          style: GoogleFonts.poppins(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Header(title: "Account"),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  settingitem(
                    title: "Your Profile",
                    leadingicon: Icons.person,
                    trailingicon: Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
            Header(title: "Privacy & Security"),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  settingitem(
                    title: "Change Password",
                    leadingicon: Icons.lock_open,
                    trailingicon: Icons.arrow_forward_ios,
                  ),
                  settingitem(
                    title: "Job Alert Notification",
                    leadingicon: Icons.notifications_outlined,
                    trailingicon: Icons.arrow_forward_ios,
                  ),
                  settingitem(
                    title: "Terms and conditions",
                    leadingicon: Icons.explore_outlined,
                    trailingicon: Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
            Header(title: "About & More"),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  settingitem(
                    title: "About Us",
                    leadingicon: Icons.import_contacts,
                    trailingicon: Icons.arrow_forward_ios,
                  ),
                  settingitem(
                    title: "Job Alert Notification",
                    leadingicon: Icons.call,
                    trailingicon: Icons.arrow_forward_ios,
                  ),
                ],
              ),
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
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          // color: Color.fromARGB(255, 15, 60, 201),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class settingitem extends StatelessWidget {
  const settingitem({
    super.key,
    required this.title,
    required this.leadingicon,
    required this.trailingicon,
  });

  final String title;
  final IconData leadingicon;
  final IconData trailingicon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingicon, size: 16),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 236, 245, 255),
        radius: 12,
        child: IconButton(onPressed: () {}, icon: Icon(trailingicon, size: 12)),
      ),
      visualDensity: VisualDensity(horizontal: -4, vertical: 0),
    );
  }
}
