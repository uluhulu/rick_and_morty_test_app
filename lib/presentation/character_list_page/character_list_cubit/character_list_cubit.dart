import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/data/characters_repository.dart';
import 'package:rick_and_morty_test_app/presentation/character_list_page/character_list_cubit/character_list_state.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final CharactersRepository charactersRepository;
  CharacterListCubit({required this.charactersRepository})
    : super(LoadingState()) {
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    var result = await charactersRepository.getCharacters();
    emit(CharacterListLoadedState(characterList: result));
  }
}
