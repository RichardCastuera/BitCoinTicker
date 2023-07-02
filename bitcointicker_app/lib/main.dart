import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme:
              AppBarTheme(color: const Color.fromARGB(255, 0, 140, 255)),
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
