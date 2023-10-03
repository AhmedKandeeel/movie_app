// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/Movie/Movie.dart';
import 'package:movie_app/Widget/Keey.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.grey,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 20))
                          ]),
                      height: 250,
                      width: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.network(
                          "${Keey.imagePath}${movie.backDropPath}",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                  "${movie.voteAverage.toStringAsFixed(1)}/10"),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10))),
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              movie.releaseDate,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.pink,
                            Colors.teal,
                          ]),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.transparent.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4)
                          ]),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 30,
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.pink,
                            Colors.teal,
                          ]),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.transparent.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4)
                          ]),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.download)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.pink,
                            Colors.teal,
                          ]),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.transparent.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4)
                          ]),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_outlined)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  movie.overview,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                movie.originalTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.teal,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.purple,
                  ]),
                ),
                child: Center(
                    child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Watch Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )),
              )
            ],
          )),
    );
  }
}
