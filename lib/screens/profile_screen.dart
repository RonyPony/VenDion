import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/bottom_menu.dart';
import '../widgets/drawer.dart';
import 'notifications_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profileScreen";

  @override
  State<ProfileScreen> createState()=>_stateProfileScreen();
  
}

class _stateProfileScreen extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GeneralDrawer(),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NotificationsScreen.routeName);
                  },
                  child: SvgPicture.asset("assets/notification-active.svg")),
            )
          ],
          title: const Text(
            "VenDion",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffff5b00),
              fontSize: 24,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ),
          BottomMenu(
            currentIndex: 2,
          ),
        ],
      ),
    );
  }
}