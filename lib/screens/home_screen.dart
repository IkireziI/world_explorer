import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'compare_screen.dart';
import 'favorites_screen.dart';
import 'details_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> countries = [];
  List<Map<String, dynamic>> favorites = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    const url = 'https://restcountries.com/v3.1/all';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          countries = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (error) {
      print('Error fetching countries: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Explorer'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favorites: favorites),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row (horizontal layout)
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5, // Aspect ratio of each item
              ),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                final countryName = country['name']['common'] ?? 'No Name';
                final countryFlag = country['flags']['png'] ?? '';
                final countryRegion = country['region'] ?? 'No Region';
                
                return Card(
                  elevation: 4,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the CompareScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompareScreen(
                            country1: country,
                            country2: countries[(index + 1) % countries.length], // Compare with the next country
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(countryFlag, height: 80, width: 80),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            countryName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(countryRegion),
                        IconButton(
                          icon: Icon(
                            favorites.contains(country)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favorites.contains(country)
                                ? Colors.red
                                : null,
                          ),
                          onPressed: () {
                            setState(() {
                              if (favorites.contains(country)) {
                                favorites.remove(country);
                              } else {
                                favorites.add(country);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
