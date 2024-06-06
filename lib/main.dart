import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movie_box/features/popular_movies/presentation/pages/popular_movies_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My movie box',
      theme: ThemeData.dark(),
      home: const PopularMoviesPage(),
    );
  }
}
