import 'package:fake_shopping_app/core/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'core/theme/light_theme.dart';
import 'features/home/view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.instance.data,
      darkTheme: DarkTheme.instance.data,
      title: 'Fake Store',
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
