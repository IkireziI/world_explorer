import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  dynamic searchedCountry;
  bool isLoading = false;

  Future<void> searchCountry(String query) async {
    setState(() {
      isLoading = true;
    });
    final url = 'https://restcountries.com/v3.1/name/$query';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          searchedCountry = json.decode(response.body)[0];
          isLoading = false;
        });
      } else {
        throw Exception('Country not found');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        searchedCountry = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Country'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter country name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: searchCountry,
            ),
            SizedBox(height: 16),
            if (isLoading) CircularProgressIndicator(),
            if (searchedCountry != null)
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'Name: ${searchedCountry['name']['common']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Image.network(
                      searchedCountry['flags']['png'],
                      height: 150,
                    ),
                    SizedBox(height: 8),
                    Text('Region: ${searchedCountry['region']}'),
                    Text('Population: ${searchedCountry['population']}'),
                    Text('Languages: ${searchedCountry['languages']?.values?.join(', ') ?? 'N/A'}'),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(country: searchedCountry),
                          ),
                        );
                      },
                      child: Text('View More Details'),
                    ),
                  ],
                ),
              ),
            if (!isLoading && searchedCountry == null && _searchController.text.isNotEmpty)
              Text('Country not found', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
