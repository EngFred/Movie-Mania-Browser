import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/features/popular_movies/presentation/provider/provider.dart';
import 'package:my_movie_box/features/popular_movies/presentation/widgets/error_indicator.dart';
import 'package:my_movie_box/features/popular_movies/presentation/widgets/loading_indicator.dart';

class PopularMoviesPage extends ConsumerStatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  ConsumerState<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends ConsumerState<PopularMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(getPopularMoviesProvider).when(data: (movies) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "Retrieved ${movies.length} movies data :)",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ));
    }, error: (errMsg, stackTrace) {
      Logger().d("error: $errMsg");
      return ErrorIndicator(errMsg: "$errMsg");
    }, loading: () {
      return const LoadingIndicator();
    }));
  }
}
