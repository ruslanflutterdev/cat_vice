import 'package:cat_vice/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'cat_tab.dart';
import 'dog_tab.dart';
import 'favorites_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cat & Dog Palette 🐱🐶'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.settings);
              },
              icon: Icon(Icons.settings),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Коты 🐱'),
              Tab(text: 'Собаки 🐶'),
              Tab(text: 'Избранное ⭐'),
            ],
          ),
        ),
        body: TabBarView(children: [CatTab(), DogTab(), FavoritesTab()]),
      ),
    );
  }
}
