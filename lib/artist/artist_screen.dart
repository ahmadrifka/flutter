import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/artist/fetch_artist.dart';

import 'artist_card.dart';

class ArtistScreen extends StatefulWidget{
  static String routesName = 'artist';

  FetchArtist fetchArtist;
  int id;


  ArtistScreen(this.fetchArtist, this.id);

  @override
  State createState() {
    print('ini artis create');
    return ArtistScreenState(fetchArtist,id);
  }
}



class ArtistScreenState extends State {
  int id;
  FetchArtist fetchArtist;
  List artistlist = new List();

  ArtistScreenState(this.fetchArtist, this.id);


  artistService() async {
    var data = await FetchArtist().fetchArtistByGenre(id);
    setState(() {
      artistlist = List.of(jsonDecode(data.body));
    });
  }


  @override
  // ignore: must_call_super
  void initState(){
    artistService();
  }
  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context).settings.arguments;
    print('ini id' + id.toString());
    initState();
    print('ini build ' + artistlist.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Artist'),
        backgroundColor: Colors.grey,
        elevation: 20,
      ),
      body: Center(
        child: Container(
          color: Colors.black87,
          child: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 2),
            itemCount: artistlist.length,
            itemBuilder: (BuildContext context, int index) {
              print('list');
              return artistCard(context, index, id, artistlist);
            },
          ),
        ),
      ),
    );
  }


}