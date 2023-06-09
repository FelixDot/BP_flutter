import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wetter-App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wetter-App'),
        ),
        body: const HomePage(),
      ),
    );
  }
}
