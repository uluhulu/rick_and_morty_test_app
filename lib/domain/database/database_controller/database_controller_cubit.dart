import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/domain/database/characters_database.dart';
import 'package:rick_and_morty_test_app/domain/database/database_controller/database_controller_state.dart';
import 'package:rick_and_morty_test_app/data/models/character_model.dart';

class DatabaseCubit extends Cubit<DatabaseControllerState> {
  final _database = AppDatabase();

  DatabaseCubit() : super(DatabaseInitialState(characterListFromDB: [])) {
    getALLCharacters();
  }

  Future<void> writeToDB(CharacteModel character) async {
    await _database
        .into(_database.charactersDatabase)
        .insert(
          CharactersDatabaseCompanion.insert(
            id: character.id,
            image: character.image,
            name: character.name,
            status: character.status,
          ),
        );

    await getALLCharacters();
  }

  Future<void> getALLCharacters() async {
    List<CharactersDatabaseData> allCharacters =
        await _database.select(_database.charactersDatabase).get();
    List<CharacteModel> l = [];
    for (var item in allCharacters) {
      l.add(CharacteModel.fromJson(item.toJson()));
    }
    // return l;
    emit(DatabaseChanged(characterListFromDB: l));
  }

  Future<void> deleteItem(int id) async {
    await (_database.delete(_database.charactersDatabase)
      ..where((a) => a.id.equals(id))).go();
    await getALLCharacters();
  }
}
