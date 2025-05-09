import 'package:dio/dio.dart';

final dio = httpClientInit();
const baseUrl = "https://rickandmortyapi.com/api";

Dio httpClientInit() {
  final option = BaseOptions(baseUrl: baseUrl);
  final dio = Dio(option);
  return dio;
}
