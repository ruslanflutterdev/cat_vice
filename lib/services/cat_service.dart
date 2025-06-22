import 'dart:typed_data';
import 'package:http/http.dart' as http;

class CatService {
  Future<Uint8List> fetchRandomCatBytes() async {
    final url = 'https://cataas.com/cat';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Не удалось загрузить кота');
    }
  }
}