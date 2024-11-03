// get data 
//return entity
import 'package:either_dart/either.dart';
import 'package:movie/core/featchers/home_featcher/data/apis/api_imp.dart';
import 'package:movie/core/featchers/home_featcher/data/model.dart';
import 'package:movie/core/featchers/home_featcher/domain/repo.dart';

class RepoImp extends Repo{
  @override
  Future<Either<String, PopularResModel>> fetchpopularMovies()async {
    try{
      PopularResModel  repoResponse;

      repoResponse =ApiImp().getMoviesList() as PopularResModel;

      return Left(await repoResponse);


  } catch (e) {
      // print('Error: $e');
      return Right("Request executing with errors:$e");
    }
}