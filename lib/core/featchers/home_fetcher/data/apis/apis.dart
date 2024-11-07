import 'package:dio/dio.dart';


abstract class Apis {

  Future <Response> getMoviesList();
}
