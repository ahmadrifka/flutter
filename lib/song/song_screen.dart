import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/song/fetch_song.dart';

class SongScreen extends StatefulWidget{

  static String routeNames = 'song';

  FetchSong fetchSong;
  int id;


  SongScreen(this.fetchSong, this.id);

  @override
  State createState() {
      return SongScreenState(id, fetchSong);
  }
}

class SongScreenState extends State{
  int id;
  FetchSong fetchSong;
  List songlist = new List();

  SongScreenState(this.id, this.fetchSong);

  songService() async {
    var data = await fetchSong.fetchSongByArtist(id);
    setState(() {
      songlist = List.of(jsonDecode(data.body));
    });
  }

  @override
  void initState() {
    songService();
  }

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments;
      return Scaffold(
        appBar: AppBar(
          title: Text('Song'),
          backgroundColor: Colors.grey,
          elevation: 20,
        ),
        body: Center(
          child: Container(
            color: Colors.black87,
            child: ListView.builder(
                itemCount: songlist.length,
                itemBuilder: (BuildContext context, int index){
                  return SongCard(index, id, songlist);
                }),
          ),
        ),
      );
  }
}


Widget SongCard(index, id, songlist){
  print('song' + songlist.length.toString());
  return Container(
    height: 70,
    width: 100,
    margin: EdgeInsets.only(top: 15),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [Colors.blue, Colors.indigo]),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Icon(CupertinoIcons.music_note, size: 30, color: Colors
              .white,),
        ),
        Container(
          child: Text(songlist[index]['title'],
            style: TextStyle(fontSize: 21, color: Colors.white)),
        ),
        Container(
          padding: EdgeInsets.only(left: 30),
          child: Text(songlist[index]['duration'],
            style: TextStyle(fontSize: 20, color: Colors.white70),),
        ),
      ],
    ),
  );
}