import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://v3.ibaity.com/api/client';

  Future<Map<String, dynamic>> get(String endPoint) async {
    final response = await Dio().get('$_baseUrl$endPoint');
    return response.data;
  }
}
