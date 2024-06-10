import 'package:my_movie_box/features/movie_trailer/data/modals/movie_trailer_dto.dart';
import 'package:my_movie_box/features/movie_trailer/domain/models/movie_trailer_response.dart';

extension MovieTrailerResponseMapper on MovieTrailerResponseDto {
  MovieTrailerResponse toMovieTrailerResponse() {
    return MovieTrailerResponse(id: id, trailers: trailers?.toTrailers());
  }
}

extension TrailerDtoMapper on TrailerDto {
  Trailer toTrailer() {
    return Trailer(id: id, key: key, type: type);
  }
}

extension TrailerDtoListMapper on List<TrailerDto> {
  List<Trailer> toTrailers() {
    return map((trailerDto) => trailerDto.toTrailer()).toList();
  }
}
