import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/search_request/search_request.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class PoiService {
  final Dio dio;

  PoiService({@required this.dio});

  Future<List<Poi>> search(SearchRequest request) async  {
    final response = await dio.post('/search', data: request.toJson());
    return (response.data as List)
      .map((json) => Poi.fromJson(json))
      .toList();
  }
}