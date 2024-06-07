import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movie_box/features/movie_details/data/repository/movie_details_repository_impl.dart';
import 'package:my_movie_box/features/movie_details/data/sources/remote/movie_details_api_service.dart';
import 'package:my_movie_box/features/movie_details/domain/usescases/get_movie_details_usecase.dart';

final movieDetailsApiServiceProvider = Provider((ref) {
  return MovieDetailsApiService.create();
});

final movieDetailsRepositoryProvider = Provider((ref) {
  final movieDetailsApiService = ref.watch(movieDetailsApiServiceProvider);
  return MovieDetailsRepositoryImpl(
      movieDetailsApiService: movieDetailsApiService);
});

final getMovieDetailsProvider = FutureProvider.family((ref, int movieId) {
  final movieDetailsRepository = ref.watch(movieDetailsRepositoryProvider);
  return GetMovieDetailsUsecase(movieDetailsRepository: movieDetailsRepository)
      .call(params: movieId);
});
