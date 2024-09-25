import 'package:flutter/material.dart';
import 'package:myapp/models/joke.dart';
import 'package:myapp/screens/joke_detail_screen.dart';
import 'package:myapp/widgets/starts.dart';

class JokeLine extends StatelessWidget {
  final Joke joke;
  final int index;
  final Function(int, int) _setRating;

  const JokeLine({
    super.key,
    required this.joke,
    required this.index,
    required Function(int, int) setRating,
  }) : _setRating = setRating;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      title: Text(
        joke.setup,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Stars(
        joke: joke,
        index: index,
        setRating: _setRating,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JokeDetailScreen(joke: joke),
          ),
        );
      },
    );
  }
}
