import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class AppService {
  final Dio dio;

  AppService({@required this.dio});

  Future<ApiConfiguration> loadApiConfiguration() async {
    final response = await dio.get("/app/configuration");
    return ApiConfiguration.fromJson(response.data);
  }
}