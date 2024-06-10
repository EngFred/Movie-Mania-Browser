import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movie_box/features/movie_trailer/data/repository/movie_trailer_repository_impl.dart';
import 'package:my_movie_box/features/movie_trailer/data/source/movie_trailer_api_service.dart';
import 'package:my_movie_box/features/movie_trailer/domain/usecases/get_movie_trailer_usecase.dart';

final movieTrailerApiServiceProvider = Provider((ref) {
  return MovieTailerApiService.create();
});

final movieTrailerRepositoryProvider = Provider((ref) {
  final movieTrailerApiService = ref.watch(movieTrailerApiServiceProvider);
  return MovieTrailerRepositoryImpl(
      movieTrailerApiService: movieTrailerApiService);
});

final getMovieTrailerUsecaseProvider =
    FutureProvider.family((ref, int movieId) async {
  final movieTrailerRepository = ref.watch(movieTrailerRepositoryProvider);
  final trailer = await GetMovieTrailerUsecase(
          movieTrailerRepository: movieTrailerRepository)
      .call(params: movieId);
  return trailer;
});
