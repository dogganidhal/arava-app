import 'package:arava/service/session.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ServiceConfiguration {
  final String apiBaseUrl;
  final Session session;

  Interceptor get authInterceptor => InterceptorsWrapper(
    onRequest: (options) async {
      final credentials = await session.getCredentials();
      if (credentials != null) {
        options.headers['Authorization'] = "${credentials.tokenType} ${credentials.accessToken}";
      }
      return options;
    },
    onResponse: (options) async {
      if (options.statusCode == 401) {

      }
      return options;
    }
  );
  Interceptor get userPreferencesInterceptor => InterceptorsWrapper(
    onRequest: (options) async {
      options.headers['Accept-Language'] = Intl.defaultLocale;
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