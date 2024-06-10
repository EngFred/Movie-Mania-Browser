import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/features/movie_trailer/data/modals/movie_trailer_dto.dart';

class MovieTrailerResponseConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    return request;
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
      Response response) {
    try {
      final mapData = json.decode(response.body) as Map<String, dynamic>;
      return response.copyWith<BodyType>(
          body: MovieTrailerResponseDto.fromJson(mapData) as BodyType);
    } catch (e) {
      Logger().i("Error $e");
      chopperLogger.warning(e);
      return Response(response.base, null, error: e);
    }
  }
}
