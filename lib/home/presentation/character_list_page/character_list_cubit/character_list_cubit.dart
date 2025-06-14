import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/home/data/models/character_model.dart';
import 'package:rick_and_morty_test_app/favorites/domain/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/home/domain/repositories/main_character_repository.dart';
import 'package:rick_and_morty_test_app/home/presentation/character_list_page/character_list_cubit/character_list_state.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final MainCharacterRepository charactersRepository;
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
    var result = await charactersRepository.getData(_page);
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

  Future<void> updateListFromDB(List<CharacteModel> listFromDB) async {
    emit(
      CharacterListLoadedState(
        characterList: state.characterList,
        characterFromDBList: listFromDB,
      ),
    );
  }
}
