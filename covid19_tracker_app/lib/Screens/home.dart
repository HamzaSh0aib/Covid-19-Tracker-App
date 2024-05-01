import 'dart:async';

import 'package:covid19_tracker_app/Screens/mainpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
        return const MainPage();
      },));
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Image(image: NetworkImage('https://tse2.mm.bing.net/th?id=OIP.aRLF38P48yDnwAJcNP6AeQHaHa&pid=Api&P=0&h=220')),
        ),
    );
  }
}