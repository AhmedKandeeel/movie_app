// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:movie_app/Account.dart';
import 'package:movie_app/Home.dart';
import 'package:movie_app/Notif.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;
  const NavBar({super.key, required this.initialIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    switch (index){
      case 0: _navigateToRoute(context, '/Home', const Home());
      break;
      case 1: _navigateToRoute(context, '/Account', const Account());
      break;
      case 2: _navigateToRoute(context, '/Notif', const Notif());
      break;
    }
  }

  void _navigateToRoute(context, String routeName, Widget screen){
    final String? CurrentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = CurrentRouteName == routeName;

    if (routeExists){
      Navigator.popUntil(context, ModalRoute.withName(routeName));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: 
      (context) => screen,
      settings: RouteSettings(name: routeName)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar( currentIndex: _selectedIndex,
    type: BottomNavigationBarType.fixed,
    onTap: _onItemTapped,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined,
        color: _selectedIndex == 0? Colors.blue : Colors.grey,),
        label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined,
        color: _selectedIndex == 1? Colors.blue : Colors.grey,),
        label: "Account"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications,
        color: _selectedIndex == 2? Colors.blue : Colors.grey,),
        label: "Notification"),
      ]);
  }
}