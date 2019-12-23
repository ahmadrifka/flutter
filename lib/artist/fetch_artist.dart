
import 'package:http/http.dart'as http;
class FetchArtist{

   fetchArtistByGenre(id) async{
    return await http.get('http://10.0.2.2:8080/artist/genre/$id');
  }


}