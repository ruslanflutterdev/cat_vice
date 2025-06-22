import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/animal_card.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context);

    if (favorites.items.isEmpty) {
      return const Center(
        child: Text('Пока нет избранных 😿⭐', style: TextStyle(fontSize: 18)),
      );
    }

    return ListView.builder(
      itemCount: favorites.items.length,
      itemBuilder: (context, index) {
        final item = favorites.items[index];
        return AnimalCard(
          imageBytes: item.imageBytes,
          advice: item.advice,
          onFavorite: () {
            favorites.removeFavorite(item);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Удалено из избранного')));
          },
        );
      },
    );
  }
}
