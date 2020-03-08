import 'package:arava/blocs/app/app_bloc.dart';
import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/blocs/profile/profile_bloc.dart';
import 'package:arava/blocs/search/search_bloc.dart';
import 'package:arava/config/service_configuration.dart';
import 'package:arava/service/app_service.dart';
import 'package:arava/service/auth_service.dart';
import 'package:arava/service/cache_manager.dart';
import 'package:arava/service/poi_service.dart';
import 'package:arava/service/session.dart';
import 'package:arava/widgets/app/bootstrap.dart';
import 'package:arava/widgets/auth/auth.dart';
import 'package:arava/widgets/main/main.dart';
import 'package:arava/widgets/map/island_selector.dart';
import 'package:arava/widgets/map/search_filters.dart';
import 'package:arava/widgets/profile/profile.dart';
import 'package:arava/widgets/settings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppModule extends MainModule {
  final ServiceConfigurationType serviceConfiguration;

  AppModule(this.serviceConfiguration);

  @override
  List<Bind> get binds => [
    Bind((inject) => GlobalKey<NavigatorState>(), singleton: true),
    Bind((inject) => CacheManager(), singleton: true),
    Bind((inject) => Session(
      cacheManager: inject.get())
    ),
    Bind((inject) {
      final session = inject.get<Session>();
      switch(serviceConfiguration) {
        case ServiceConfigurationType.DEV:
          return ServiceConfiguration.dev(session: session);
        case ServiceConfigurationType.STAGING:
          return ServiceConfiguration.staging(session: session);
        default:
          return ServiceConfiguration.production(session: session);
      }
    }, singleton: true),
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
    Bind((inject) => AppService(
      dio: inject.get()
    )),
    Bind((inject) => AuthService(
      dio: inject.get()
    )),
    Bind((inject) => PoiService(
      dio: inject.get()
    )),
    Bind((inject) => AppBloc(
      appService: inject.get(),
      session: inject.get(),
      navigationBloc: inject.get(),
      authBloc: inject.get()
    )),
    Bind((inject) => NavigationBloc(
      navigatorState: inject.get()
    )),
    Bind((inject) => SearchBloc(
      poiService: inject.get()
    )),
    Bind((inject) => AuthBloc(
      session: inject.get(),
      authService: inject.get()
    )),
    Bind((inject) => ProfileBloc(
      authService: inject.get(),
      session: inject.get()
    ))
  ];

  @override
  List<Router> get routers => [
    Router("/home", child: (_, args) => Main()),
    Router("/settings", child: (_, args) => Settings()),
    Router("/search/selectIslands", child: (_, args) => IslandSelector()),
    Router("/auth", child: (_, args) => Auth()),
    Router("/profile", child: (_, args) => Profile()),
    Router("/search/filters", child: (_, args) => SearchFilters())
  ];

  @override
  Widget get bootstrap => Bootstrap();

  factory AppModule.dev() => AppModule(ServiceConfigurationType.DEV);
  factory AppModule.staging() => AppModule(ServiceConfigurationType.STAGING);
  factory AppModule.production() => AppModule(ServiceConfigurationType.PROD);
}