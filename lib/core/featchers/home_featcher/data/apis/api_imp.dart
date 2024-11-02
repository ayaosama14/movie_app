import 'package:either_dart/either.dart';
import 'package:movie/core/featchers/home_featcher/data/apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/utils/app_response.dart';

class ApiImp implements Apis {
  static const url =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  static const Map<String, String> header = {
    'accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWE4NzZmZTRiZWRjNDNjZWZlNGRmMDgyN2NiMTU3YSIsIm5iZiI6MTczMDU1Nzk2MC43MDAxNTQzLCJzdWIiOiI2NzIzYjc3NGQ5YThhNzdiNWRhNDhiMzkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.gMAhMovfvtvGst6yEdiaiD1yXRA2z6az5JQM4zeMzag'
  };
  final _dio = Dio();

  @override
  Future<Either<String, APIResponse>> getMoviesList({path = url}) async {
    try {
      //im trying to do get to any type of movies
      // getMoviesList({path=url, endPoint='movie/popular',queryParams=const {'language':'en-US','page':'1'}}

      // path=('$url$endPoint?'+queryParams!);
      final response = await _dio.get(url, options: Options(headers: header));
      print('Response data: ${response.data}');

      return Right(await response.data);
    } catch (e) {
      print('Error: $e');
      return Left("Request executing with errors:$e");
    }
  }
}
