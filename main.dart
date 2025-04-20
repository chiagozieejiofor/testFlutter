import 'dart:ui';

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:testinterview/searchpage.dart';

import 'HomePage.dart';
import 'favourite.dart';
import 'globalVariable.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // make status bar transparent
      statusBarIconBrightness: Brightness.dark, // or Brightness.light
      systemNavigationBarColor: Colors.white, // bottom nav bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo MoniePoint',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo MoniePoint'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyContent(_index),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: SizedBox(
          height: 100,
          child: FloatingNavbar(
            itemBorderRadius: 24,
            iconSize: 17,
            elevation: 5,
            selectedBackgroundColor: const Color(0xFFfc8c03),
            borderRadius: 32,
            onTap: (int val) {
              setState(() {
                _index = val;
              });
              //returns tab id which is user tapped
            },
            currentIndex: _index,
            items: [
              FloatingNavbarItem(
                customWidget: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              FloatingNavbarItem(
                customWidget: HugeIcon(
                  icon: HugeIcons.strokeRoundedBubbleChat,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              FloatingNavbarItem(
                customWidget: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome05,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              FloatingNavbarItem(
                customWidget: HugeIcon(
                  icon: HugeIcons.strokeRoundedFavourite,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              FloatingNavbarItem(
                customWidget: HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ],
          ).animate().moveY(
            begin: 200,
            end: 0,
            delay: const Duration(seconds: 1),
            duration: const Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}


Widget _buildBodyContent(int index) {
  switch (index) {
    case 0:
      return const SearchPage();
    case 1:
      return const Mylove();
    case 2:
      return const Homepage();
    case 3:
      return const Mylove();
    default:
      return const MyHomePage(title: '',);
  }
}
