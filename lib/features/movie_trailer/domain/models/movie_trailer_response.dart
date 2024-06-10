class MovieTrailerResponse {
  final int? id;
  final List<Trailer>? trailers;

  MovieTrailerResponse({
    this.id,
    this.trailers,
  });
}

class Trailer {
  final String? key;
  final String? type;
  final String? id;

  Trailer({
    this.key,
    this.type,
    this.id,
  });
}
