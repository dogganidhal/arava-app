

class ApiException implements Exception {
  final String message;
  final String code;
  final int statusCode;

  ApiException({this.message, this.code, this.statusCode});
}