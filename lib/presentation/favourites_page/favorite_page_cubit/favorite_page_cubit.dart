import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/domain/character.dart';
import 'package:rick_and_morty_test_app/presentation/favourites_page/favorite_page_cubit/favorite_page_state.dart';

class FavoritePageCubit extends Cubit<FavoritePageState> {
  final DatabaseCubit databaseCubit;
  FavoritePageCubit(this.databaseCubit) : super(LoadingState()) {
    getCharactersFromDB();
  }

  void updateList(List<Character> charactersFromDB) {
    emit(FavoriteListLoadedState(characterList: charactersFromDB));
  }

  Future<void> getCharactersFromDB() async {
    await databaseCubit.getALLCharacters();
  }

  // Future<void> deleteItemFromDB(int id) async {
  //   await databaseController.deleteItem(id);
  //   var characterFromDB = await getCharactersFromDB();
  //   emit(FavoriteListLoadedState(characterList: characterFromDB));
  // }

  void sortName() {
    var list = (state as FavoriteListLoadedState).characterList;
    list.sort((a, b) => a.name.compareTo(b.name));
    emit(FavoriteListLoadedState(characterList: list));
  }
}
