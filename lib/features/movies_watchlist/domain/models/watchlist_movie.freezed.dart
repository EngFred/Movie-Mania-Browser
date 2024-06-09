// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchlistMovie _$WatchlistMovieFromJson(Map<String, dynamic> json) {
  return _WatchlistMovie.fromJson(json);
}

/// @nodoc
mixin _$WatchlistMovie {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistMovieCopyWith<WatchlistMovie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistMovieCopyWith<$Res> {
  factory $WatchlistMovieCopyWith(
          WatchlistMovie value, $Res Function(WatchlistMovie) then) =
      _$WatchlistMovieCopyWithImpl<$Res, WatchlistMovie>;
  @useResult
  $Res call(
      {int id,
      String? title,
      String? posterPath,
      String? releaseDate,
      String? tagline});
}

/// @nodoc
class _$WatchlistMovieCopyWithImpl<$Res, $Val extends WatchlistMovie>
    implements $WatchlistMovieCopyWith<$Res> {
  _$WatchlistMovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? tagline = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistMovieImplCopyWith<$Res>
    implements $WatchlistMovieCopyWith<$Res> {
  factory _$$WatchlistMovieImplCopyWith(_$WatchlistMovieImpl value,
          $Res Function(_$WatchlistMovieImpl) then) =
      __$$WatchlistMovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? title,
      String? posterPath,
      String? releaseDate,
      String? tagline});
}

/// @nodoc
class __$$WatchlistMovieImplCopyWithImpl<$Res>
    extends _$WatchlistMovieCopyWithImpl<$Res, _$WatchlistMovieImpl>
    implements _$$WatchlistMovieImplCopyWith<$Res> {
  __$$WatchlistMovieImplCopyWithImpl(
      _$WatchlistMovieImpl _value, $Res Function(_$WatchlistMovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? tagline = freezed,
  }) {
    return _then(_$WatchlistMovieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistMovieImpl implements _WatchlistMovie {
  _$WatchlistMovieImpl(
      {required this.id,
      this.title,
      this.posterPath,
      this.releaseDate,
      this.tagline});

  factory _$WatchlistMovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistMovieImplFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? posterPath;
  @override
  final String? releaseDate;
  @override
  final String? tagline;

  @override
  String toString() {
    return 'WatchlistMovie(id: $id, title: $title, posterPath: $posterPath, releaseDate: $releaseDate, tagline: $tagline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistMovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.tagline, tagline) || other.tagline == tagline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, posterPath, releaseDate, tagline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistMovieImplCopyWith<_$WatchlistMovieImpl> get copyWith =>
      __$$WatchlistMovieImplCopyWithImpl<_$WatchlistMovieImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistMovieImplToJson(
      this,
    );
  }
}

abstract class _WatchlistMovie implements WatchlistMovie {
  factory _WatchlistMovie(
      {required final int id,
      final String? title,
      final String? posterPath,
      final String? releaseDate,
      final String? tagline}) = _$WatchlistMovieImpl;

  factory _WatchlistMovie.fromJson(Map<String, dynamic> json) =
      _$WatchlistMovieImpl.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  String? get posterPath;
  @override
  String? get releaseDate;
  @override
  String? get tagline;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistMovieImplCopyWith<_$WatchlistMovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
