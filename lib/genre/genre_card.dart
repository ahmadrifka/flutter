import 'package:flutter/cupertino.dart';
import 'package:spotify/artist/artist_screen.dart';

import 'fetch_genre.dart';

Widget GenreCard (context, index, genreList){
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context,
            ArtistScreen.routesName, arguments: genreList[index]['id']),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 30, offset: Offset(0, 2), spreadRadius:
                2, )
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(genreList[index]['picture'],fit:
            BoxFit.contain,),
          ),
        ),
      ),
    );
  }