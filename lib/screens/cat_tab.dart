import 'dart:typed_data';
import 'package:cat_vice/services/advice_service.dart';
import 'package:cat_vice/services/cat_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/animal_card.dart';

class CatTab extends StatefulWidget {
  const CatTab({super.key});

  @override
  State<CatTab> createState() => _CatTabState();
}

class _CatTabState extends State<CatTab> {
  final CatService _catService = CatService();
  final AdviceService _adviceService = AdviceService();

  Uint8List? _imageBytes;
  String? _advice;

  Future<void> _load() async {
    final cat = await _catService.fetchRandomCatBytes();
    final advice = await _adviceService.fetchAdvice();
    setState(() {
      _imageBytes = cat;
      _advice = advice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _load,
            child: Text('Показать кота и совет 🐱'),
          ),
          SizedBox(height: 20),
          if (_imageBytes != null && _advice != null)
            AnimalCard(
              imageBytes: _imageBytes!,
              advice: _advice!,
              onFavorite: () {
                favorites.addFavorite(
                  FavoriteItem(imageBytes: _imageBytes!, advice: _advice!),
                );
              },
            ),
        ],
      ),
    );
  }
}
