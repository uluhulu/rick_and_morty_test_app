import 'package:rick_and_morty_test_app/data/services/api_manager.dart';
import 'package:rick_and_morty_test_app/data/models/character_model.dart';

abstract class CharactersRepository {
  Future<List<CharacteModel>> getData(int page);
}
