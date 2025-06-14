import 'package:rick_and_morty_test_app/home/home.dart';

abstract class CharactersRepository {
  Future<List<CharacteModel>> getData(int page);
}
