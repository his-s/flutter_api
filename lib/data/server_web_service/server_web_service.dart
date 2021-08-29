import 'package:dio/dio.dart';
import 'package:flutter_api/constants/strings.dart';

class ServerWebService {
  late Dio dio;
  ServerWebService() {
    BaseOptions options = BaseOptions(
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<dynamic> getServerAllData() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
