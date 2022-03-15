import 'package:flutter/material.dart';

import 'ITheme.dart';

class DarkTheme extends ITheme {
  DarkTheme._();
  static final DarkTheme _instance = DarkTheme._();
  static DarkTheme get instance => _instance;

  final ThemeData _darkTheme = ThemeData.dark();

  @override
  ThemeData get data => ThemeData(
        appBarTheme: _darkTheme.appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          textTheme: _darkTheme.textTheme.apply(bodyColor: colors.white),
          titleTextStyle: TextStyle(
              color: colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: false,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: colors.sunSetOrange, size: 30),
        ),
        iconTheme: _darkTheme.iconTheme.copyWith(color: colors.gunPowder),
        bottomNavigationBarTheme: _darkTheme.bottomNavigationBarTheme.copyWith(
          type: BottomNavigationBarType.fixed,
          backgroundColor: colors.gunPowder,
          selectedItemColor: colors.sunSetOrange,
          selectedLabelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          selectedIconTheme: _darkTheme.iconTheme
              .copyWith(color: colors.sunSetOrange, size: 34),
          unselectedItemColor: colors.white,
          unselectedIconTheme:
              _darkTheme.iconTheme.copyWith(color: colors.white, size: 24),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: colors.sunSetOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        textTheme: _darkTheme.textTheme.apply(bodyColor: colors.gunPowder),
        scaffoldBackgroundColor: colors.gunPowderLight,
        primaryColor: colors.white,
        colorScheme: _darkTheme.colorScheme.copyWith(
          onPrimary: colors.gunPowder,
          secondary: colors.sunSetOrange,
        ),
      );
}
