// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/Details.dart';
import 'package:movie_app/Widget/Keey.dart';

class AiSlider extends StatelessWidget {
  const AiSlider({super.key, required this.snapshot});
  
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index){
      return Padding(padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => Details(movie: snapshot.data[index])
            ),
          );
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 200,
              width: 150,
              child: Image.network(
                "${Keey.imagePath}${snapshot.data![index].posterPath}",
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ),
        );
    }
    );
  }
}