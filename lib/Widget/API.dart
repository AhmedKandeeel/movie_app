// ignore_for_file: file_names

import 'dart:convert';
import 'package:movie_app/Movie/Movie.dart';
import 'package:movie_app/Widget/Keey.dart';
import 'package:http/http.dart' as http;

class API {
  static const _topUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Keey.apikey}';
  static const _popUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=${Keey.apikey}';
  static const _allUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Keey.apikey}';

   Future<List<Movie>> getTopMovies() async{
    final response = await http.get(Uri.parse(_topUrl));
    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something Error");
    }
   }

   Future<List<Movie>> getPopMovies() async{
    final response = await http.get(Uri.parse(_popUrl));
    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something Error");
    }
   }

   Future<List<Movie>> getAllMovies() async{
    final response = await http.get(Uri.parse(_allUrl));
    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something Error");
    }
   }
}