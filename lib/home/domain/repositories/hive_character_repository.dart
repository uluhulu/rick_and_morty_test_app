import 'package:hive/hive.dart';
import 'package:rick_and_morty_test_app/home/data/repositories/characters_repository.dart';
import 'package:rick_and_morty_test_app/home/data/models/character_model.dart';

class HiveCharacterRepository implements CharactersRepository {
  final String boxName;

  HiveCharacterRepository({required this.boxName});

  @override
  Future<List<CharacteModel>> getData(int page) async {
    final box = await Hive.openBox(boxName);
    final rawList = box.get(page, defaultValue: []);
    return (rawList as List)
        .map((e) => CharacteModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> saveData(List<CharacteModel> data, int page) async {
    final box = await Hive.openBox(boxName);
    final jsonList = data.map((e) => e.toJson()).toList();
    await box.put(page, jsonList);
  }
}
