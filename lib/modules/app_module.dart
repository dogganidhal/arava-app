import 'package:arava_app/blocs/app_bloc/app_bloc.dart';
import 'package:arava_app/config/service_configuration.dart';
import 'package:arava_app/service/app_service.dart';
import 'package:arava_app/service/cache_manager.dart';
import 'package:arava_app/service/session.dart';
import 'package:arava_app/widgets/app/bootstrap.dart';
import 'package:arava_app/widgets/main/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [
    Bind((inject) => CacheManager(), singleton: true),
    Bind((inject) => Session(cacheManager: inject.get())),
    Bind((inject) => ServiceConfiguration.dev(session: inject.get()), singleton: true),
    Bind((inject) {
      final serviceConfiguration = inject.get<ServiceConfiguration>();
      final dio = Dio(BaseOptions(
        baseUrl: serviceConfiguration.apiBaseUrl,
      ));
      dio.interceptors.add(serviceConfiguration.authInterceptor);
      dio.interceptors.add(serviceConfiguration.logInterceptor);
      return dio;
    }),
    Bind((inject) => AppBloc(appService: inject.get(), session: inject.get()), singleton: true),
    Bind((inject) => AppService(dio: inject.get()))
  ];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => Main()),
  ];

  // add your main widget here
  @override
  Widget get bootstrap => Bootstrap();

}