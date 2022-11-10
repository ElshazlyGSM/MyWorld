import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';


ThemeData lightMode = ThemeData(
  primaryColor: defaultColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(onPrimary: defaultColor,),
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    titleSpacing: 20,
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
  ),
  // fontFamily: 'Roboto',
);

ThemeData darkMode = ThemeData(
  primaryColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF23252D),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    titleSpacing: 20,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color(0xFF23252D),
    ),
    backgroundColor: Color(0xFF23252D),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Color(0xFF23252D),
  ),
);
