import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendion/screens/favorites_screen.dart';
import 'package:vendion/screens/home_screen.dart';
import 'package:vendion/screens/profile_screen.dart';

class GeneralDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SvgPicture.asset(
              "assets/logo.svg",
            ),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            },
          ),
          ListTile(
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, FavoriteScreen.routeName, (route) => false);
            },
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, ProfileScreen.routeName, (route) => false);
            },
          ),
          ListTile(
            title: const Text('Conversaciones'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
