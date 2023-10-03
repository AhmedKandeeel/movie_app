// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {

  List<String> tabs = ["Top Rated", "Popular", "Now Playing"];

  int current = 0;

  double changePosition() {
    switch (current) {
      case 0 : return 0;
      case 1 : return 70;
      case 2 : return 190;

      default: return 0;
    }
  }

  double changecontainerwidth() {
    switch (current) {
      case 0 : return 80;
      case 1 : return 50;
      case 2 : return 80;

      default: return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 40,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 10: 23, top: 7),
                          child: Text(tabs[index], style: const TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      );
                    }
                    ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                left: changePosition(),
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  width: changecontainerwidth(),
                  height: 5,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black
                  ),
                  ),
              )
            ],
          ),
        ),

        Padding(padding: const EdgeInsets.only(top: 4),
        child: Text("${tabs[current]} Tabcontext"))
      ],
    );
    }
}