import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://v3.ibaity.com/api/client';

  Future<Map<String, dynamic>> get(
      String endPoint, Map<String, dynamic>? queryParams) async {
    final response = await Dio().get('$_baseUrl$endPoint$queryParams');
    return response.data;
  }
}
