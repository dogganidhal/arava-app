import 'package:arava_app/service/session.dart';
import 'package:dio/dio.dart';


class ServiceConfiguration {
  final String apiBaseUrl;
  final Session session;

  Interceptor get authInterceptor => InterceptorsWrapper(
    onRequest: (options) async {
      final credentials = session.getCredentials();
      if (credentials != null) {

      }
      return options;
    }
  );
  Interceptor get logInterceptor => LogInterceptor()
    ..responseBody = true;

  ServiceConfiguration({this.apiBaseUrl, this.session});

  factory ServiceConfiguration.dev({Session session}) => ServiceConfiguration(
    apiBaseUrl: "http://localhost:8080",
    session: session
  );

  factory ServiceConfiguration.staging({Session session}) => ServiceConfiguration(
    apiBaseUrl: "https://api.arava.ga",
    session: session
  );
}