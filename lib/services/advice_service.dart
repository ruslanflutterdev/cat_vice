import 'dart:convert';
import 'package:http/http.dart' as http;

class AdviceService {
  Future<String> fetchAdvice() async {
    final url = 'https://api.adviceslip.com/advice';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['slip']['advice'];
    } else {
      throw Exception('Не удалось загрузить совет');
    }
  }
}