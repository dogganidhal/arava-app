import 'package:arava/model/favorite/favorite.dart';
import 'package:arava/model/island/island.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/rate_comment_request/rate_comment_request.dart';
import 'package:arava/model/search_request/search_request.dart';
import 'package:arava/model/search_response/search_response.dart';
import 'package:arava/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';


class PoiService extends DioService {
  PoiService({@required Dio dio}) : super(dio: dio);

  Future<SearchResponse> search(SearchRequest request) async  {
    final response = await post('/search', data: request.toJson());
    return SearchResponse.fromJson(response.data);
  }
  
  Future<List<Favorite>> getFavorites() async {
    final response = await get('/user/favorite');
    return (response.data as List)
      .map((jsonMap) => Favorite.fromJson(jsonMap))
      .toList();
  }

  Future<List<Poi>> getSponsored(Island island) async {
    final response = await get<List>("/island/${island.id}/sponsored");
    final pois = response.data
      .map((js) => Poi.fromJson(js))
      .cast<Poi>()
      .toList();
    return pois;
  }

  Future<List<Poi>> getActivities(Island island) async {
    final response = await get<List>("/island/${island.id}/activities");
    final pois = response.data
      .map((js) => Poi.fromJson(js))
      .cast<Poi>()
      .toList();
    return pois;
  }

  Future<void> syncFavorites(List<Poi> favorites) async {
    await put('/user/favorite', data: favorites
      .map((poi) => poi.id)
      .toList()
    );
  }

  Future<void> submitComment(Poi poi, RateCommentRequest request) async {
    await post("/poi/${poi.id}/comment", data: request.toJson());
  }

  Future<List<int>> downloadBytes(String url) async {
    final response = await dio.get(url, options: Options(
      responseType: ResponseType.bytes
    ));
    return response.data;
  }
}