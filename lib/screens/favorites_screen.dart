import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;

  FavoritesScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Countries'),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('No favorite countries yet.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final country = favorites[index];
                final countryName = country['name']['common'] ?? 'No Name';
                final countryFlag = country['flags']['png'] ?? '';

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.network(
                      countryFlag,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      countryName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: country, // Pass the selected country to DetailsScreen
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
