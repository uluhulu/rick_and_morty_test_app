import 'package:rick_and_morty_test_app/favorites/favorites.dart';

class FavoritePageCubit extends Cubit<FavoritePageState> {
  final DatabaseCubit databaseCubit;
  FavoritePageCubit(this.databaseCubit) : super(LoadingState()) {
    getCharactersFromDB();
  }

  void updateList(List<CharacteModel> charactersFromDB) {
    emit(FavoriteListLoadedState(characterList: charactersFromDB));
  }

  Future<void> getCharactersFromDB() async {
    await databaseCubit.getALLCharacters();
  }

  void sortName() {
    var list = (state as FavoriteListLoadedState).characterList;
    list.sort((a, b) => a.name.compareTo(b.name));
    emit(FavoriteListLoadedState(characterList: list));
  }
}
