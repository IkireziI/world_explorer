import 'package:flutter/material.dart';

class CompareScreen extends StatelessWidget {
  final Map<String, dynamic> country1;
  final Map<String, dynamic> country2;

  CompareScreen({required this.country1, required this.country2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Countries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCountryCard(country1),
                SizedBox(width: 16), // Space between the two country cards
                _buildCountryCard(country2),
              ],
            ),
            SizedBox(height: 20),
            _buildComparisonDetails(country1, country2),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryCard(Map<String, dynamic> country) {
    final countryName = country['name']['common'] ?? 'No Name';
    final countryFlag = country['flags']['png'] ?? '';
    final countryRegion = country['region'] ?? 'No Region';

    return Expanded(
      child: Card(
        child: Column(
          children: [
            Image.network(countryFlag, height: 100, fit: BoxFit.cover),
            Text(countryName, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(countryRegion),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonDetails(Map<String, dynamic> country1, Map<String, dynamic> country2) {
    final country1Languages = _getLanguages(country1);
    final country2Languages = _getLanguages(country2);
    final country1Population = _getPopulation(country1);
    final country2Population = _getPopulation(country2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildComparisonRow('Languages:', country1Languages, country2Languages),
        _buildComparisonRow('Population:', country1Population, country2Population),
      ],
    );
  }

  String _getLanguages(Map<String, dynamic> country) {
    final languages = country['languages'] ?? {};
    return languages.values.join(', ') ?? 'Unknown';
  }

  String _getPopulation(Map<String, dynamic> country) {
    return country['population']?.toString() ?? 'Unknown';
  }

  Widget _buildComparisonRow(String title, String value1, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text('$title  ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value1)),
          Expanded(child: Text(value2)),
        ],
      ),
    );
  }
}
