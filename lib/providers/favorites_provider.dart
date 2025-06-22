import 'dart:typed_data';
import 'package:flutter/material.dart';

class FavoriteItem {
  final Uint8List imageBytes;
  final String advice;

  FavoriteItem({required this.imageBytes, required this.advice});
}

class FavoritesProvider with ChangeNotifier {
  final List<FavoriteItem> _items = [];

  List<FavoriteItem> get items => List.unmodifiable(_items);

  void addFavorite(FavoriteItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeFavorite(FavoriteItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearFavorites() {
    _items.clear();
    notifyListeners();
  }
}