import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.binance.com/api/v3/',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );

  Future<List<dynamic>> getTickers() async {
    try {
      final response = await dio.get('/ticker/24hr');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load tickers: $e');
    }
  }
}
