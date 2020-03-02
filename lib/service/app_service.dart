import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class AppService extends DioService {
  AppService({@required Dio dio}) : super(dio: dio);

  Future<ApiConfiguration> loadApiConfiguration() async {
    final response = await get("/app/configuration");
    return ApiConfiguration.fromJson(response.data);
  }
}