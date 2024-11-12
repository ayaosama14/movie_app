import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // create a list of the endpoints where you don't need to pass a token.
    final listOfEndpoints = <String>[
      '/movie/popular',
    ];

    // Load your token here and pass to the header
    var token =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWE4NzZmZTRiZWRjNDNjZWZlNGRmMDgyN2NiMTU3YSIsIm5iZiI6MTczMTM0NzQzMy4wNzYyNzYzLCJzdWIiOiI2NzIzYjc3NGQ5YThhNzdiNWRhNDhiMzkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.dT0wVCURw_Dt6joh11NoxUgE3_no60ishGnUcYswXkk';

    options.headers
        .addAll({'accept': 'application/json', 'Authorization': token});
    return handler.next(options);
  }
}
