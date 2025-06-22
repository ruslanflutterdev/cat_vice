import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import '../providers/favorites_provider.dart';
import '../services/advice_service.dart';
import '../services/dog_service.dart';
import '../widgets/animal_card.dart';

class DogTab extends StatefulWidget {
  const DogTab({super.key});

  @override
  State<DogTab> createState() => _DogTabState();
}

class _DogTabState extends State<DogTab> {
  final DogService _dogService = DogService();
  final AdviceService _adviceService = AdviceService();

  Uint8List? _imageBytes;
  String? _advice;

  Future<void> _load() async {
    final dog = await _dogService.fetchRandomDogBytes();
    final advice = await _adviceService.fetchAdvice();
    setState(() {
      _imageBytes = dog;
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
            child: Text('Показать собаку и совет 🐶'),
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
