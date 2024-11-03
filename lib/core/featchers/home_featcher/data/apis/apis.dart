import 'package:either_dart/either.dart';
import 'package:movie/core/utils/app_response.dart';

import '../model.dart';

abstract class Apis {
  //im trying to do get to any type of movies
  // Future<APIResponse> getMoviesList(
  //     {required String path,
  //     required String endPoint,
  //     Map<String, String>? queryParams});
  Future<Either<String, PopularResModel>> getMoviesList();
}
