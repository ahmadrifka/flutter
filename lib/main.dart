
import 'package:flutter/material.dart';
import 'package:spotify/artist/fetch_artist.dart';
import 'package:spotify/genre/fetch_genre.dart';
import 'package:spotify/genre/genre_screen.dart';
import 'package:spotify/artist/artist_screen.dart';
import 'package:spotify/song/fetch_song.dart';
import 'package:spotify/song/song_screen.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Home',
    initialRoute: GenreScreen.routesName,
//    routes: {
//      GenreScreen.routesName : (context) => GenreScreen(),
//        ArtistScreen.routesName : (context) => ArtistScreen(),
//      SongScreen.routeNames : (context) => SongScreen(),
//    },
    onGenerateRoute: (RouteSettings settings){
      var routes = <String, WidgetBuilder>{
        GenreScreen.routesName : (context) => GenreScreen(FetchGenre()),
        ArtistScreen.routesName : (context) => ArtistScreen(FetchArtist(),
            settings.arguments),
        SongScreen.routeNames : (context) => SongScreen(FetchSong(), settings.arguments),
      };
      WidgetBuilder route = routes[settings.name];
      return MaterialPageRoute(builder: (context) => route(context));
    }

));

