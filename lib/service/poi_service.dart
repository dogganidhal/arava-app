import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/search_request/search_request.dart';
import 'package:arava/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class PoiService extends DioService {
  PoiService({@required Dio dio}) : super(dio: dio);

  Future<List<Poi>> search(SearchRequest request) async  {
    final response = await post('/search', data: request.toJson());
    return (response.data as List)
      .map((json) => Poi.fromJson(json))
      .toList();
  }
}