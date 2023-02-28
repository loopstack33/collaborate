import 'package:collaborate/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';


Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Collaborate',
    androidNotificationOngoing: true,
    androidShowNotificationBadge: true,

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collaborate',
      theme: ThemeData(
          useMaterial3: true,
        fontFamily: "Poppins",
          appBarTheme:const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent
          ),
      ),
      home: const HomeScreen(),
    );
  }
}

