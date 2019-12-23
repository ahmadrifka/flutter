import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/genre/fetch_genre.dart';

import 'genre_card.dart';

class GenreScreen extends StatefulWidget{

  static const routesName = "genre";

  FetchGenre fetchGenre;
  GenreScreen(this.fetchGenre);

  @override
  State createState() {
    print('createGenre');
    return GenreScreenState(fetchGenre);

  }
}


class GenreScreenState extends State<GenreScreen>{

  FetchGenre fetchGenre;
  List genrelist = new List();

  GenreScreenState(this.fetchGenre);

  genreService() async {
    var data = await fetchGenre.fetchGenreData();
    setState(() {
      genrelist = List.of(jsonDecode(data.body));
    });
  }


  @override
  void initState() {
    genreService();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Genre',),
          backgroundColor: Colors.grey,
          elevation: 20,
        ),
        body: Center(
          child: (
              Container(
            width: 400,
            child: ListView.builder(
              padding: EdgeInsets.all(20),
                itemCount: genrelist.length,
                itemBuilder: (BuildContext context, int index){
                  return GenreCard(context, index, genrelist);
                }),
          )),
        ),
      );
  }
}
