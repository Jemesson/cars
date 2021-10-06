import 'dart:convert';
import 'package:http/http.dart' as http;

class ImagesAPI {
  Future<String> fetchImageURL(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/search/photos/?client_id=TR94AmAMbwk6KAJu6fHLxg6Wn0UL7Zrq_vIhojXG0hs&query=$query&page=1&per_page=1'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["results"][0]["urls"]["regular"];
    } else {
      throw Exception('Deu erro!!');
    }
  }
}
