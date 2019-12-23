
import 'package:http/http.dart' as http;
class FetchSong {

   fetchSongByArtist(id) async{
     return await http.get('http://10.0.2.2:8080/song/artist/$id');

  }

}