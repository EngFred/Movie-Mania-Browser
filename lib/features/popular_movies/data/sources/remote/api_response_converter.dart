import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/features/popular_movies/data/models/api_response.dart';

class ApiResponseConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    return request;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(
    Response response,
  ) {
    try {
      final mapData = json.decode(response.body) as Map<String, dynamic>;
      return response.copyWith<BodyType>(
          body: PopularMoviesApiResponse.fromJson(mapData) as BodyType);
    } catch (e) {
      Logger().i("Error $e");
      chopperLogger.warning(e);
      return Response(response.base, null, error: e);
    }
  }
}
