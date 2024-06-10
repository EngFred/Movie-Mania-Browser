import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_trailer_dto.g.dart';

@JsonSerializable()
class MovieTrailerResponseDto {
  final int? id;
  @JsonKey(name: "results")
  final List<TrailerDto>? trailers;

  MovieTrailerResponseDto({
    this.id,
    this.trailers,
  });

  factory MovieTrailerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovieTrailerResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieTrailerResponseDtoToJson(this);
}

@JsonSerializable()
class TrailerDto {
  @JsonKey(name: "iso_639_1")
  final String? iso6391;
  @JsonKey(name: "iso_3166_1")
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  @JsonKey(name: "published_at")
  final String? publishedAt;
  final String? id;

  TrailerDto({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory TrailerDto.fromJson(Map<String, dynamic> json) =>
      _$TrailerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TrailerDtoToJson(this);
}
