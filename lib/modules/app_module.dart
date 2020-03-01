import 'package:arava/blocs/app/app_bloc.dart';
import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/blocs/search/search_bloc.dart';
import 'package:arava/config/service_configuration.dart';
import 'package:arava/service/app_service.dart';
import 'package:arava/service/auth_service.dart';
import 'package:arava/service/cache_manager.dart';
import 'package:arava/service/session.dart';
import 'package:arava/widgets/app/bootstrap.dart';
import 'package:arava/widgets/auth/auth.dart';
import 'package:arava/widgets/main/main.dart';
import 'package:arava/widgets/map/island_selector.dart';
import 'package:arava/widgets/settings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [
    Bind((inject) => GlobalKey<NavigatorState>(), singleton: true),
    // Api services
    Bind((inject) => CacheManager(), singleton: true),
    Bind((inject) => Session(cacheManager: inject.get())),
    Bind((inject) => ServiceConfiguration.dev(session: inject.get()), singleton: true),
    Bind((inject) {
      final serviceConfiguration = inject.get<ServiceConfiguration>();
      final dio = Dio(BaseOptions(
        baseUrl: serviceConfiguration.apiBaseUrl,
      ));
      dio.interceptors.add(serviceConfiguration.authInterceptor);
      dio.interceptors.add(serviceConfiguration.userPreferencesInterceptor);
      dio.interceptors.add(serviceConfiguration.logInterceptor);
      return dio;
    }),
    Bind((inject) => AppService(dio: inject.get())),
    Bind((inject) => AuthService(dio: inject.get())),
    // BLoCs
    Bind((inject) => AppBloc(
      appService: inject.get(),
      session: inject.get(),
      navigationBloc: inject.get()
    ), singleton: true),
    Bind((inject) => NavigationBloc(navigatorState: inject.get()), singleton: true),
    Bind((inject) => SearchBloc()),
    Bind((inject) => AuthBloc(
      session: inject.get(),
      authService: inject.get()
    ))
  ];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/home", child: (_, args) => Main()),
    Router("/settings", child: (_, args) => Settings()),
    Router("/search/selectIslands", child: (_, args) => IslandSelector()),
    Router("/auth", child: (_, args) => Auth())
  ];

  // add your main widget here
  @override
  Widget get bootstrap => Bootstrap();

}