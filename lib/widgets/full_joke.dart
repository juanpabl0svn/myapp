import 'package:flutter/material.dart';
import 'package:myapp/screens/joke_detail_screen.dart';

class FullJoke extends StatelessWidget {

  final dynamic joke;

  const FullJoke({super.key, required this.joke});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ListTile(
        title: Text(joke['setup']),
        subtitle: Text(joke['punchline']),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JokeDetailScreen(joke: joke),
            ),
          );
        },
      ),
    );
  }
}
