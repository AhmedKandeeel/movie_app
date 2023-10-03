// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/NavBar/Custom.dart';

class Notif extends StatefulWidget {
  const Notif({super.key});

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Custom(
      showNavBar: true,
      initialIndex: 2,
      body: SafeArea(
        child: Scaffold(
          body: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        )),
    );
  }
}