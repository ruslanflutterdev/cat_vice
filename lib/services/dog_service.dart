import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class DogService {
  Future<Uint8List> fetchRandomDogBytes() async {
    final url = 'https://dog.ceo/api/breeds/image/random';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final imageUrl = data['message'];

      final imageResponse = await http.get(Uri.parse(imageUrl));
      if (imageResponse.statusCode == 200) {
        return imageResponse.bodyBytes;
      } else {
        throw Exception('Не удалось загрузить картинку собаки');
      }
    } else {
      throw Exception('Не удалось получить URL собаки');
    }
  }
}