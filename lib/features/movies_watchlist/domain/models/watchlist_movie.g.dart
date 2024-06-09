// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchlistMovieImpl _$$WatchlistMovieImplFromJson(Map<String, dynamic> json) =>
    _$WatchlistMovieImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      posterPath: json['posterPath'] as String?,
      releaseDate: json['releaseDate'] as String?,
      tagline: json['tagline'] as String?,
    );

Map<String, dynamic> _$$WatchlistMovieImplToJson(
        _$WatchlistMovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'tagline': instance.tagline,
    };
