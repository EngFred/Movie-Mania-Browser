import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/features/movie_details/data/models/movie_details_response.dart';

class MovieDetailsApiResponseConverter implements Converter {
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
          body: MovieDetailsResponse.fromJson(mapData) as BodyType);
    } catch (e) {
      Logger().i("Error $e");
      return Response(response.base, null, error: e);
    }
  }
}
