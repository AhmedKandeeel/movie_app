// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_app/Category/AiSlider.dart';
import 'package:movie_app/Category/AllSlider.dart';
import 'package:movie_app/Details.dart';
import 'package:movie_app/NavBar/Custom.dart';
import 'package:movie_app/Movie/Movie.dart';
import 'package:movie_app/Widget/API.dart';
import 'package:movie_app/Widget/Keey.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late Future<List<Movie>> topMovies;
  late Future<List<Movie>> popMovies;
  @override
  void initState() {
    super.initState();
    topMovies = API().getTopMovies();
    popMovies = API().getPopMovies();
  }

  String dropdownValue = "All";

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Custom(
      showNavBar: true,
      initialIndex: 0,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onChanged: (value) {},
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      prefixIconColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      const Text(
                        "Films in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: const [
                          DropdownMenuItem(
                              value: "All",
                              child: Text(
                                "All",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: "London",
                              child: Text(
                                "London",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: "US",
                              child: Text(
                                "US",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: "Egypt",
                              child: Text(
                                "Egypt",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: "Korea",
                              child: Text(
                                "Korea",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: "Spain",
                              child: Text(
                                "Spain",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: "Italy",
                              child: Text(
                                "Italy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                        ],
                        onChanged: (value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                            controller: tabController,
                            isScrollable: true,
                            labelPadding: EdgeInsets.only(left: 20, right: 20),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                text: "Top Rated",
                              ),
                              Tab(
                                text: "Popular",
                              ),
                              Tab(
                                text: "Now Playing",
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 300,
                    child: TabBarView(controller: tabController, children: [
                      SizedBox(
                        child: FutureBuilder(
                          future: topMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return AllSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: popMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return AiSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: topMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return AllSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("All Films",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                  Lists(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Lists extends StatefulWidget {
  const Lists({
    super.key,
  });

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  late Future<List<Movie>> allMovies;
  @override
  void initState() {
    super.initState();
    allMovies = API().getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height - 500,
      child: FutureBuilder(
        future: allMovies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return ItemLists(
              snapshot: snapshot,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ItemLists extends StatelessWidget {
  const ItemLists({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, itemsIndex) {
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:8, top: 8),
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Details(movie: snapshot.data[itemsIndex])),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 250,
                            width: 150,
                            child: Image.network(
                              "${Keey.imagePath}${snapshot.data[itemsIndex].posterPath}",
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 250,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(snapshot.data[itemsIndex].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text(snapshot.data[itemsIndex].releaseDate),
                          SizedBox(height: 15,),
                          Row(children: [
                            Icon(Icons.star, color: Colors.amber, size: 25,),
                            SizedBox(width: 3,),
                            Text("${snapshot.data[itemsIndex].voteAverage.toStringAsFixed(1)}/10", style: TextStyle(fontWeight: FontWeight.bold),)
                          ],)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
