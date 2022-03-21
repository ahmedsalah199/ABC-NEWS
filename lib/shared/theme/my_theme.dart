import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
      appBarTheme:  AppBarTheme(
          color: Colors.grey.shade900,
          elevation: 0,
          toolbarHeight: 130,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          titleTextStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)
      ),
    colorScheme: const ColorScheme.dark(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.yellowAccent,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed
    )

  );
  static final lightTheme =  ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          toolbarHeight: 130,
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)
      ),
      primarySwatch: Colors.blue,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white
      )
  );
}