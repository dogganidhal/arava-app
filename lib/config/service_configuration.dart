import 'package:arava/service/auth_service.dart';
import 'package:arava/service/session.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class ServiceConfiguration {
  final AuthService authService;
  final String apiBaseUrl;
  final Session session;

  ServiceConfiguration({
    @required this.apiBaseUrl,
    @required this.session,
    @required this.authService
  });

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
        final credentials = await session.getCredentials();
        if (credentials != null) {
          // TODO: Refresh credentials and retry
        }
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

  factory ServiceConfiguration.dev({@required Session session, AuthService authService}) => ServiceConfiguration(
    apiBaseUrl: "http://localhost:8080",
    session: session,
    authService: authService
  );

  factory ServiceConfiguration.staging({@required Session session, AuthService authService}) => ServiceConfiguration(
    apiBaseUrl: "https://api.arava.ga",
    session: session,
    authService: authService
  );
}