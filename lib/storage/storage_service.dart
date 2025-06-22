import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../providers/favorites_provider.dart';

class StorageService {
  static const String _fileName = 'favorites.json';

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }


  Future<void> saveFavorites(List<FavoriteItem> items) async {
    final file = await _getFile();
    final jsonList = items.map((item) {
      return {
        'advice': item.advice,
        'image': base64Encode(item.imageBytes),
      };
    }).toList();

    await file.writeAsString(jsonEncode(jsonList));
  }

  Future<List<FavoriteItem>> loadFavorites() async {
    try {
      final file = await _getFile();
      if (!(await file.exists())) return [];

      final jsonString = await file.readAsString();
      final List decoded = jsonDecode(jsonString);

      return decoded.map((entry) {
        return FavoriteItem(
          advice: entry['advice'],
          imageBytes: base64Decode(entry['image']),
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
