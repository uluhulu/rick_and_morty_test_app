import 'package:rick_and_morty_test_app/home/home.dart';

class NetworkCharacterRepository implements CharactersRepository {
  NetworkCharacterRepository();

  @override
  Future<List<CharacteModel>> getData(int page) async {
    final response = await dio.get(
      '/character',
      queryParameters: {"page": page},
    );
    final results =
        (response.data["results"] as List)
            .map((x) => CharacteModel.fromJson(x))
            .toList();
    return results;
  }
}
