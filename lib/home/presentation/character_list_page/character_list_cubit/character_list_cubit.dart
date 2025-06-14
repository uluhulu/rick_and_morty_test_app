import 'package:rick_and_morty_test_app/home/home.dart';

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
