import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchGenre {

    fetchGenreData() async{
    return await http.get('http://10.0.2.2:8080/genre/');
  }

}