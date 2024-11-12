import 'package:dio/dio.dart';
import '../Interceptors.dart';
import 'apis.dart';

class ApiImp implements Apis {
  var dio = Dio();



  @override
  Future<Response> getPopMoviesList() async {
    dio.options.baseUrl='https://api.themoviedb.org/3';
    dio.interceptors.add(AuthInterceptor());

    Response response = await dio.get(
        '/movie/popular',
      queryParameters: {'language': 'en-US', 'page': '1'},
    );
    // print('Api imp Response data: ${response.data}');
    return response;
  }
}
