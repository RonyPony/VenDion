import 'package:flutter/cupertino.dart';
import 'package:vendion/screens/filters_screen.dart';
import 'package:vendion/screens/home_screen.dart';
import 'package:vendion/screens/login_screen.dart';
import 'package:vendion/screens/register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // LandingPage.routeName: (context) => const LandingPage(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  FiltersScreen.routeName: (context) =>  FiltersScreen(),
  // RegisterPage.routeName: (context) => RegisterPage(),
  // ChatScreen.routeName: (context) => ChatScreen(),
  // Conversation.routeName: (context) => Conversation(),
};
