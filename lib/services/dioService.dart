import 'package:dio/dio.dart';

class DioService {
  // private constructor
  DioService._privateConstructor() {
    print("DioService instance created");
  }

  // singleton instance
  static final DioService _instance = DioService._privateConstructor();

  // Get the Dio instance
  static DioService get instance => _instance;

  // Dio instance
  final Dio _dio = Dio();

  Dio get dio => _dio;
}
