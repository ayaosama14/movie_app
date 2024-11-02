import 'package:movie/scr/home_featcher/data/apis.dart';
import 'package:dio/dio.dart';

class ApiImp implements Apis {
  static const url = 'https://api.themoviedb.org/3/account/21603376';
//  const url = 'https://api.themoviedb.org/3/authentication';
  static const Map<String, String> header = {
    'accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWE4NzZmZTRiZWRjNDNjZWZlNGRmMDgyN2NiMTU3YSIsIm5iZiI6MTczMDM5NTcxNS4xNDU5MjAzLCJzdWIiOiI2NzIzYjc3NGQ5YThhNzdiNWRhNDhiMzkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qAdM2M7xcPET2mtSUlbiVdKVMOEt3PxtlKa6mxGgWtk',
  };

  final _dio = Dio();
  @override
  Future getMoviesList({path = url, options = Options(headers: header)}) async {
    try {
      final response = await _dio.get(url, options: Options(headers: header));
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }
}
