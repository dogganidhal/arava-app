import 'dart:io';

import 'package:arava/model/user/user.dart';
import 'package:arava/service/auth_service.dart';
import 'package:arava/service/session.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';

enum ServiceConfigurationType {
  DEV, STAGING, PROD
}

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
    }
  );
  Interceptor get userPreferencesInterceptor => InterceptorsWrapper(
    onRequest: (options) async {
      options.headers['Accept-Language'] = await session.getPreferredLocale();
      options.headers['User-Agent'] = await _buildUserAgent(await session.getUser());
      return options;
    }
  );
  Interceptor get logInterceptor => LogInterceptor()
    ..requestBody = true
    ..responseBody = true;

  factory ServiceConfiguration.dev({@required Session session, AuthService authService}) => ServiceConfiguration(
    apiBaseUrl: "http://localhost:8080",
    session: session,
    authService: authService
  );

  factory ServiceConfiguration.staging({@required Session session, AuthService authService}) => ServiceConfiguration(
    apiBaseUrl: "https://api.arava-tahiti.com",
    session: session,
    authService: authService
  );

  factory ServiceConfiguration.production({@required Session session, AuthService authService}) => ServiceConfiguration(
    apiBaseUrl: "https://api.arava-tahiti.com",
    session: session,
    authService: authService
  );

  Future<String> _buildUserAgent(User user) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final model = Platform.isIOS ?
      await DeviceInfoPlugin().iosInfo.then((info) => info.model) :
      await DeviceInfoPlugin().androidInfo.then((info) => info.model);;
    // <product> / <product-version> / <device-model>
    return "Arava Mobile / "
      "${packageInfo.version} (${packageInfo.buildNumber}) / "
      "${model}";
  }
}
