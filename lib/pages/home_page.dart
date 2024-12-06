import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future<void> getMovies() async {
    Uri _uri = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=4ed25ac7fb1284dcd639db3db9502e08"); // Cambia <<YOUR_API_KEY>> por tu clave de TMDB

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      setState(() {
        movies = myMap["results"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
