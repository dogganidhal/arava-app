import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/api_exception/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:super_enum/super_enum.dart';

abstract class DioService {
  final Dio _dio;

  DioService({@required Dio dio}) : _dio = dio;

  @protected
  Future<Response<T>> get<T>(String uri) async {
    try {
      return await _dio.get(uri);
    } catch (exception) {
      _catchException(exception);
    }
  }

  @protected
  Future<Response<T>> post<T>(String uri, {data}) async {
    try {
      return await _dio.post(uri, data: data);
    } catch (exception) {
      _catchException(exception);
    }
  }

  @protected
  Future<Response<T>> put<T>(String uri, {data}) async {
    try {
      return await _dio.put(uri, data: data);
    } catch (exception) {
      _catchException(exception);
    }
  }

  @alwaysThrows
  void _catchException(Exception error) {
    if (error is DioError) {
      ApiException apiException = ApiException.fromJson(error.response.data);
      throw LocalizedRemoteException.fromErrorCode(apiException.errorCode);
    } else {
      throw UnexpectedException();
    }
  }
}