import 'dart:convert';
import 'package:rick_and_morty_test_app/data/services/api_manager.dart';
import 'package:rick_and_morty_test_app/data/repositories/characters_repository.dart';
import 'package:rick_and_morty_test_app/data/models/character_model.dart';

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
  // final response = await http.get(Uri.parse(apiUrl));

  // if (response.statusCode == 200) {
  //   final List<dynamic> jsonList = json.decode(response.body);
  //   return jsonList.map((json) => DataModel.fromJson(json)).toList();
  // } else {
  //   throw Exception('Failed to load data from network');
  // }
}
