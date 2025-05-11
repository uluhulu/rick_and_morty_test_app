import 'package:rick_and_morty_test_app/domain/api_manager.dart';
import 'package:rick_and_morty_test_app/domain/character.dart';

class CharactersRepository {
  Future<List<Character>> getCharacters({required int page}) async {
    final response = await dio.get(
      '/character',
      queryParameters: {"page": page},
    );
    var data = GetCharacterAnswer.fromJson(response.data);
    return data.results;
  }
}
