import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic country;

  DetailsScreen({this.country});

  @override
  Widget build(BuildContext context) {
    if (country == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Country Details'),
        ),
        body: Center(
          child: Text(
            'No country details available.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    final name = country['name']['common'] ?? 'No Name';
    final flag = country['flags']['png'] ?? '';
    final population = country['population']?.toString() ?? 'Unknown';
    final region = country['region'] ?? 'No region';
    final capital = country['capital'] != null && country['capital'].isNotEmpty
        ? country['capital'][0]
        : 'No capital';
    final languages = country['languages']?.values?.join(', ') ?? 'No languages';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  flag,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Country: $name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Capital: $capital',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Region: $region',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Population: $population',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Languages: $languages',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
