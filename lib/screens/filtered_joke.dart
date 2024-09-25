import 'package:flutter/material.dart';
import 'package:myapp/widgets/full_joke.dart';

class FilteredJokesScreen extends StatelessWidget {
  final List jokes;

  const FilteredJokesScreen({super.key, required this.jokes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chistes Filtrados'),
        backgroundColor: Colors.deepPurple,
      ),
      body: jokes.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.grey[500],
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'No hay chistes con esta cantidad de estrellas.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return FullJoke(joke: joke);
              },
            ),
    );
  }
}
