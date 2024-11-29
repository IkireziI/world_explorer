import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/compare_screen.dart';
import 'screens/details_screen.dart';

void main() {
  runApp(WorldExplorerApp());
}

class WorldExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/favorites': (context) => FavoritesScreen(favorites: []),
        '/compare': (context) => CompareScreen(country1: {}, country2: {},),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final country = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => DetailsScreen(country: country),
          );
        }
        return null;
      },
    );
  }
}
