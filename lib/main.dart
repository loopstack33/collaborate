import 'package:collaborate/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collaborate',
      theme: ThemeData(
          useMaterial3: true,
        fontFamily: "Poppins",
          appBarTheme:const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.white,
            foregroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
          ),
      ),
      home: const HomeScreen(),
    );
  }
}

