
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/bottom_menu.dart';
import 'notifications_screen.dart';

class FavoriteScreen extends StatefulWidget {
  static String routeName="/favoriteScreen";

  @override
  State<FavoriteScreen> createState()=>_StateFavoriteScreen();
  
}

class _StateFavoriteScreen extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: (){
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
                  Text("Favoritos",style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffff5b00).withOpacity(.5)
                  ),)
                ],
              ),
            ),
            BottomMenu(currentIndex: 1,),
          ],
        )
    );
  }
}