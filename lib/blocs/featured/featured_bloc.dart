import 'dart:async';

import 'package:arava/blocs/featured/event/featured_event.dart';
import 'package:arava/blocs/featured/state/featured_state.dart';
import 'package:arava/blocs/global_context/global_context_bloc.dart';
import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/island/island.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/service/poi_service.dart';
import 'package:arava/service/session.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class FeaturedBloc extends Bloc<FeaturedEvent, FeaturedState> {
  final GlobalContextBloc globalContextBloc;
  final PoiService poiService;
  final Session session;

  StreamSubscription<GlobalContextState> _globalContextSubscription;
  String _islandId;

  FeaturedBloc({
    @required this.globalContextBloc,
    @required this.poiService,
    @required this.session
  }) {
    _globalContextSubscription = globalContextBloc
      .distinct()
      .listen((state) {
        if (state.selectedIsland.id != _islandId) {
          loadFeatured(state.selectedIsland);
          loadActivities(state.selectedIsland);
          _islandId = state.selectedIsland.id;
        }
      });
  }

  @override
  Future<void> close() async {
    await _globalContextSubscription.cancel();
    return super.close();
  }
  
  @override
  FeaturedState get initialState => FeaturedState.featuredLoadingState();

  @override
  Stream<FeaturedState> mapEventToState(FeaturedEvent event) => event.when(
    featuredLoadSponsoredEvent: _loadSponsored,
    featuredLoadActivitiesEvent: _loadActivities
  );
  
  void loadFeatured(Island island) {
    add(FeaturedEvent.featuredLoadSponsoredEvent(island: island));
  }

  void loadActivities(Island island) {
    add(FeaturedEvent.featuredLoadActivitiesEvent(island: island));
  }
  
  Stream<FeaturedState> _loadSponsored(FeaturedLoadSponsoredEvent event) async* {
    final activities = state.whenOrElse(
      featuredReadyState: (readyState) => readyState.activities,
      orElse: (_) => <Poi>[]
    );
    yield FeaturedState.featuredLoadingState();
    try {
      final sponsoredPois = await poiService.getSponsored(event.island);
      yield FeaturedState.featuredReadyState(
        featured: sponsoredPois,
        activities: activities
      );
    } on AppException catch (exception) {
      yield FeaturedState.featuredFailingState(exception: exception);
    }
  }

  Stream<FeaturedState> _loadActivities(FeaturedLoadActivitiesEvent event) async* {
    final featured = state.whenOrElse(
        featuredReadyState: (readyState) => readyState.featured,
        orElse: (_) => <Poi>[]
    );
    yield FeaturedState.featuredLoadingState();
    try {
      final activities = await poiService.getActivities(event.island);
      yield FeaturedState.featuredReadyState(
        activities: activities,
        featured: featured
      );
    } on AppException catch (exception) {
      yield FeaturedState.featuredFailingState(exception: exception);
    }
  }
}