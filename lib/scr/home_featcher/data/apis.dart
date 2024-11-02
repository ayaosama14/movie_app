import 'package:dio/dio.dart';

abstract class Apis {
//get data

  Future getMoviesList({required String path, required Options options});
}
