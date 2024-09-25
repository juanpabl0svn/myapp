import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final dynamic joke;
  final int index;
  final Function(int, int) setRating;

  const Stars({
    super.key,
    required this.joke,
    required this.index,
    required this.setRating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (starIndex) {
        return IconButton(
          icon: Icon(
            starIndex < joke["rating"] ? Icons.star : Icons.star_border,
          ),
          color: Colors.amber,
          onPressed: () {
            setRating(index, starIndex + 1);
          },
        );
      }),
    );
  }
}
