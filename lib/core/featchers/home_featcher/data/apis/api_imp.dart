

import 'package:movie/core/featchers/home_featcher/data/apis/apis.dart';
import 'package:dio/dio.dart';


import '../../../../utils/app_response.dart';


class ApiImp implements Apis {
  static const url =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  static const Map<String, String> header = {
    'accept': 'application/json',
    'Authorization':
    'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWE4NzZmZTRiZWRjNDNjZWZlNGRmMDgyN2NiMTU3YSIsIm5iZiI6MTczMDgzMzgwOS4wNTA1NjQ4LCJzdWIiOiI2NzIzYjc3NGQ5YThhNzdiNWRhNDhiMzkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.k_G05dVNzZ27_bwFK1Nk1wgDHTs_btuoUF9FscKLQpw'   };
  final _dio = Dio();

  @override
  Future<Response> getMoviesList() async {



    Response response = await _dio.get(
      url, options: Options(headers: header),) ;
    print('Api imp Response data: ${response.data}');
    return response;
  }}
