
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../domain/pop_movie_repo.dart';
import '../Models/pop_movie_model.dart';
import '../apis/api_imp.dart';

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