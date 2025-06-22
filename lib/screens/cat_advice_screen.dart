import 'dart:typed_data';
import 'package:cat_vice/services/advice_service.dart';
import 'package:cat_vice/services/cat_service.dart';
import 'package:flutter/material.dart';

class CatAdviceScreen extends StatefulWidget {
  const CatAdviceScreen({super.key});

  @override
  State<CatAdviceScreen> createState() => _CatAdviceScreenState();
}

class _CatAdviceScreenState extends State<CatAdviceScreen> {
  final CatService _catService = CatService();
  final AdviceService _adviceService = AdviceService();

  Uint8List? _catBytes;
  String? _advice;

  Future<void> _getCatAndAdvice() async {
    try {
      final cat = await _catService.fetchRandomCatBytes();
      final advice = await _adviceService.fetchAdvice();
      setState(() {
        _catBytes = cat;
        _advice = advice;
      });
    } catch (e) {
      debugPrint('Ошибка: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat + Advice 🐱💡'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getCatAndAdvice,
              child: const Text('Показать кота и совет 🐾'),
            ),
            const SizedBox(height: 20),
            if (_catBytes != null)
              Image.memory(
                _catBytes!,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              )
            else
              const Text('Кот ещё не загружен 😸'),

            const SizedBox(height: 20),
            if (_advice != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '"$_advice"',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
              )
            else
              const Text('Совет ещё не загружен 💡'),
          ],
        ),
      ),
    );
  }
}