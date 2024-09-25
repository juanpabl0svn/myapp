import 'package:flutter/material.dart';
import 'jokes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido a la app de chistes',
                style: TextStyle(fontSize: 24)),
            const SizedBox(height: 36,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JokesScreen()),
                );
              },
              child: const Text('Ver Chistes'),
            ),
          ],
        ),
      ),
    );
  }
}
