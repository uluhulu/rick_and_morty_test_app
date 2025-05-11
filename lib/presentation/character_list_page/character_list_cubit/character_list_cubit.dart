import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/data/characters_repository.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/domain/character.dart';
import 'package:rick_and_morty_test_app/presentation/character_list_page/character_list_cubit/character_list_state.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final CharactersRepository charactersRepository;
  final DatabaseCubit databaseController;
  CharacterListCubit({
    required this.charactersRepository,
    required this.databaseController,
  }) : super(InitialState(characterList: [])) {
    loadCharacters();
  }
  int _page = 0;

  Future<void> loadCharacters() async {
    if (state is CharacterListLoadedState) {
      emit(
        LoadData(
          characterList: state.characterList,
          characterFromDBList:
              (state as CharacterListLoadedState).characterFromDBList,
        ),
      );
    }
    _page++;
    var result = await charactersRepository.getCharacters(page: _page);
    var list = state.characterList;
    list.addAll(result);

    emit(
      CharacterListLoadedState(
        characterList: list,
        characterFromDBList:
            state is CharacterListLoadedState
                ? (state as CharacterListLoadedState).characterFromDBList
                : [],
      ),
    );
  }

  // Future<void> addToFavourite(Character character) async {
  //   await databaseController.writeToDB(character);
  //   var characterFromDB = await getCharactersFromDB();
  //   emit(
  //     CharacterListLoadedState(
  //       characterList: (state as CharacterListLoadedState).characterList,
  //       characterFromDBList: characterFromDB,
  //     ),
  //   );
  // }

  // Future<void> deleteItemFromDB(int id) async {
  //   await databaseController.deleteItem(id);
  //   var characterFromDB = await getCharactersFromDB();
  //   emit(
  //     CharacterListLoadedState(
  //       characterList: (state as CharacterListLoadedState).characterList,
  //       characterFromDBList: characterFromDB,
  //     ),
  //   );
  // }

  Future<void> updateListFromDB(List<Character> listFromDB) async {
    var result = await databaseController.getALLCharacters();
    emit(
      CharacterListLoadedState(
        characterList: state.characterList,
        characterFromDBList: listFromDB,
      ),
    );
  }
}
