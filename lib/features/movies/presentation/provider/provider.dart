import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movie_box/features/movies/data/repository/movies_repository_impl.dart';
import 'package:my_movie_box/features/movies/data/sources/remote/movies_api_service.dart';
import 'package:my_movie_box/features/movies/domain/models/movie_request_params.dart';
import 'package:my_movie_box/features/movies/domain/usescases/get_popular_movies_usecase.dart';
import 'package:my_movie_box/features/movies/domain/usescases/search_movie_usecase.dart';
import 'package:my_movie_box/features/movies/presentation/provider/search_mode_notifier.dart';

final moviesApiServiceProvider = Provider((ref) {
  return MoviesApiService.create();
});

final moviesRepositoryProvider = Provider((ref) {
  final moviesApiService = ref.watch(moviesApiServiceProvider);
  return MoviesRepositoryImpl(moviesApiService: moviesApiService);
});

final getPopularMoviesUsecaseProvider =
    FutureProvider.family((ref, MoviesRequestParams params) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);
  return GetPopularMoviesUsecase(moviesRepository: moviesRepository)
      .call(params: params);
});

final searchMovieUsecaseProvider =
    FutureProvider.family((ref, MoviesRequestParams params) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);
  return SearchMovieUsecase(moviesRepository: moviesRepository)
      .call(params: params);
});

final searchModeProvider =
    StateNotifierProvider<SearchModeNotifier, bool>((ref) {
  return SearchModeNotifier();
});
