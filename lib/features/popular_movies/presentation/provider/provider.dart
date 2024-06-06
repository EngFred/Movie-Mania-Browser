import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movie_box/features/popular_movies/data/repository/movies_repository_impl.dart';
import 'package:my_movie_box/features/popular_movies/data/sources/remote/movies_api_service.dart';
import 'package:my_movie_box/features/popular_movies/domain/usescases/get_popular_movies_usecase.dart';

final moviesApiServiceProvider = Provider((ref) {
  return MoviesApiService.create();
});

final movieRepositoryProvider = Provider((ref) {
  final moviesApiService = ref.watch(moviesApiServiceProvider);
  return MoviesRepositoryImpl(moviesApiService: moviesApiService);
});

final getPopularMoviesProvider = FutureProvider((ref) {
  final moviesRepository = ref.watch(movieRepositoryProvider);
  return GetPopularMoviesUsecase(moviesRepository: moviesRepository).call();
});
