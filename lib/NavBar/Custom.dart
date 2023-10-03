// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/NavBar/NavBar.dart';
 class Custom extends StatelessWidget {
  final Widget body;
    final bool showNavBar;
    final int initialIndex;
  const Custom({super.key, required this.body, this.showNavBar = false, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: showNavBar? NavBar(initialIndex: initialIndex) : null,
    );
  }
}