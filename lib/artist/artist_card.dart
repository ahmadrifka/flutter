import 'package:flutter/material.dart';
import 'package:spotify/song/song_screen.dart';

import 'fetch_artist.dart';


Widget artistCard (context, index, id, artistlist){
  print('Artiscard');
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SongScreen.routeNames,
          arguments: artistlist[index]['id'] ),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(artistlist[index]['picture'],
            fit:
            BoxFit.cover,) ,
        ),
      ),
    );
  }