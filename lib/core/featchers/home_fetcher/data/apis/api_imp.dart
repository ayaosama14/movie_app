import 'package:dio/dio.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/const.dart';
import '../Interceptors.dart';
import 'apis.dart';

class ApiImp implements Apis {
  var dio = Dio();


  @override
  Future<Response> getPopMoviesList({ int  page=1  }) async {

    dio.options.baseUrl=AppConst.baseUrl;
    dio.interceptors.add(AuthInterceptor());

    Response response = await dio.get(
        AppConst.popularEndPoint,
      queryParameters: {'language': 'en-US', 'page': page},
    );
    // print('Api imp Response data: ${response.data}');
    return response;
  }
}
