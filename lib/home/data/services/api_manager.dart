import 'package:rick_and_morty_test_app/home/home.dart';

final dio = httpClientInit();

Dio httpClientInit() {
  final option = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
  );
  final dio = Dio(option);
  return dio;
}
