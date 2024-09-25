import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/core/utils.dart';
import 'package:myapp/widgets/filter_button.dart';
import 'package:myapp/screens/filtered_joke.dart';
import 'package:myapp/widgets/joke_line.dart';
import 'dart:convert';

class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  List _jokes = [];

  @override
  void initState() {
    super.initState();
    _fetchJokes();
  }

  Future<void> _fetchJokes() async {
    final response = await http
        .get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        _jokes = json.decode(response.body).map((joke) {
          return {...joke, "rating": Random().nextInt(3) + 1};
        }).toList();
      });
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  void _setRating(int jokeIndex, int rating) {
    setState(() {
      _jokes[jokeIndex]["rating"] = rating; // Actualiza la calificación
    });
  }

  void _navigateToFilteredJokes(BuildContext context, int ratingFilter) {
    final filteredJokes = _jokes.where((joke) {
      return joke["rating"] == ratingFilter;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilteredJokesScreen(jokes: filteredJokes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Chistes Divertidos'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                  text: '3 Estrellas',
                  onPressed: () => _navigateToFilteredJokes(context, 3),
                ),
                FilterButton(
                  text: '2 Estrellas',
                  onPressed: () => _navigateToFilteredJokes(context, 2),
                ),
                FilterButton(
                  text: '1 Estrella',
                  onPressed: () => _navigateToFilteredJokes(context, 1),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _jokes.length,
                itemBuilder: (context, index) {
                  final joke = _jokes[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: JokeLine(index: index, joke: joke, setRating: _setRating,),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
