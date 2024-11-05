
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:movie/core/featchers/home_featcher/data/apis/api_imp.dart';
import 'package:movie/core/featchers/home_featcher/data/model.dart';
import 'package:movie/core/featchers/home_featcher/domain/repo.dart';
import 'package:movie/core/utils/app_response.dart';

class RepoImp extends Repo{
  ApiImp popularApiImp=ApiImp();

  @override
   Future<Either<String, PopularResModel>> fetchPopularMovies()async {
    // APIResponse   apiResponse;


       Response response  =await popularApiImp.getMoviesList()  ;
if(response.statusCode==200) {
  PopularResModel instancePopResModel= await PopularResModel.fromJson(response.data);
  print("* RepoImp response is :${instancePopResModel}");

  return  Right( instancePopResModel);



  } else{

      return Left( "${response.statusMessage}");
      // return   Left("Request executing with errors:$e");
}}}