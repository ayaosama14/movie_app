

import 'package:dio/dio.dart';
import 'apis.dart';


class ApiImp implements Apis {
  static const url =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  static const Map<String, String> header = {
    'accept': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWE4NzZmZTRiZWRjNDNjZWZlNGRmMDgyN2NiMTU3YSIsIm5iZiI6MTczMTM0NzQzMy4wNzYyNzYzLCJzdWIiOiI2NzIzYjc3NGQ5YThhNzdiNWRhNDhiMzkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.dT0wVCURw_Dt6joh11NoxUgE3_no60ishGnUcYswXkk'}
  ;
  final _dio = Dio();

  @override
  Future<Response> getMoviesList() async {



    Response response = await _dio.get(
      url, options: Options(headers: header),) ;
    print('Api imp Response data: ${response.data}');
    return response;
  }}
