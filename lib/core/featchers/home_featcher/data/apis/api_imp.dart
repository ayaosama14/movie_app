

import 'package:movie/core/featchers/home_featcher/data/apis/apis.dart';
import 'package:dio/dio.dart';


import '../../../../utils/app_response.dart';


class ApiImp implements Apis {
  static const url =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  static const Map<String, String> header = {
    'accept': 'application/json',
    'Authorization':
    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWE4NzZmZTRiZWRjNDNjZWZlNGRmMDgyN2NiMTU3YSIsIm5iZiI6MTczMDY1OTYyNC44Mzg2NTYsInN1YiI6IjY3MjNiNzc0ZDlhOGE3N2I1ZGE0OGIzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.n8TBitFBvni9chovPCWcGwDaEnlvucB7CBEr1HGL3wE'
  };
  final _dio = Dio();

  @override
  Future<Response> getMoviesList() async {



    Response response = await _dio.get(
      url, options: Options(headers: header),) ;
    print('Api imp Response data: ${response.data}');
    return response;
  }}
