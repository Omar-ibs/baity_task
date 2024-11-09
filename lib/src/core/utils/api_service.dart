import 'package:dio/dio.dart';

class ApiService {
  Future<Map<String, dynamic>> get() async {
    final response =
        await Dio().get('https://v3.ibaity.com/api/client/Realestate');
    return response.data;
  }
}
