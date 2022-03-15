import 'package:fake_shopping_app/core/theme/ITheme.dart';
import 'package:flutter/material.dart';

class LightTheme extends ITheme {
  LightTheme._();
  static final LightTheme _instance = LightTheme._();
  static LightTheme get instance => _instance;

  final ThemeData _lightTheme = ThemeData.light();

  @override
  ThemeData get data => ThemeData(
        appBarTheme: _lightTheme.appBarTheme.copyWith(
          iconTheme: _lightTheme.iconTheme.copyWith(color: colors.gunPowder),
          backgroundColor: Colors.transparent,
          textTheme: _lightTheme.textTheme.apply(bodyColor: colors.gunPowder),
          titleTextStyle: TextStyle(
              color: colors.gunPowder,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          centerTitle: false,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: colors.sunSetOrange, size: 30),
        ),
        bottomNavigationBarTheme: _lightTheme.bottomNavigationBarTheme.copyWith(
          type: BottomNavigationBarType.fixed,
          backgroundColor: colors.white,
          selectedItemColor: colors.sunSetOrange,
          selectedLabelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          selectedIconTheme: _lightTheme.iconTheme
              .copyWith(color: colors.sunSetOrange, size: 34),
          unselectedItemColor: colors.gunPowder,
          unselectedIconTheme:
              _lightTheme.iconTheme.copyWith(color: colors.gunPowder, size: 24),
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
        textTheme: _lightTheme.textTheme.apply(bodyColor: colors.gunPowder),
        scaffoldBackgroundColor: colors.background,
        primaryColor: colors.gunPowder,
        accentColor: colors.sunSetOrange,
        colorScheme: _lightTheme.colorScheme.copyWith(
          // primary: colors.sunSetOrange,
          secondary: colors.sunSetOrange,
          onPrimary: colors.white,
        ),
      );
}
