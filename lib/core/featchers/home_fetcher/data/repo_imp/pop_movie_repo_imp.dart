import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../utils/di.dart';
import '../../domain/pop_movie_repo.dart';
import '../Models/pop_movie_model.dart';
import '../apis/api_imp.dart';

class RepoImp extends Repo {

//   PopularResModel instancePopResModel= getIt.get<PopularResModel>();
  ApiImp popularApiImp = getIt.get<ApiImp>();

  @override
  Future<Either<String, PopularResModel>> fetchPopularMovies(
      {int? page}) async {
    // APIResponse   apiResponse;

    Response response = await popularApiImp.getPopMoviesList(page: page!);
    if (response.statusCode == 200) {
      PopularResModel instancePopResModel =
          PopularResModel.fromJson(response.data);

      return Right(instancePopResModel);
    } else {
      return Left("${response.statusMessage}");
      // return   Left("Request executing with errors:$e");
    }
  }
}
