import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';
import 'providers/favorites_provider.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'Cat & Dog Palette',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.favorites: (context) => const FavoritesTab(),
        },
      ),
    );
  }
}
