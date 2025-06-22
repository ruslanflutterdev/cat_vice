import 'dart:typed_data';
import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  final Uint8List imageBytes;
  final String advice;
  final VoidCallback onFavorite;

  const AnimalCard({
    super.key,
    required this.imageBytes,
    required this.advice,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.memory(
            imageBytes,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              advice,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton.icon(
            onPressed: onFavorite,
            icon: Icon(Icons.star),
            label: Text('В избранное'),
          ),
        ],
      ),
    );
  }
}
