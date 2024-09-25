import 'package:flutter/material.dart';


class FilterButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const FilterButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        side: const BorderSide(color: Colors.deepPurple),
      ),
      child: Text(text),
    );
  }
}