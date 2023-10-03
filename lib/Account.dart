// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/NavBar/Custom.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Custom(
      showNavBar: true,
      initialIndex: 1,
      body: Scaffold(
        body: Container(
          height: 300,
          width: 300,
          color: Colors.brown,
        ),
      ),
    );
  }
}