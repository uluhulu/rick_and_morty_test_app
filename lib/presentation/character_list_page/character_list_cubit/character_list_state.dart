import 'package:rick_and_morty_test_app/domain/character.dart';

abstract class CharacterListState {
  final List<Character> characterList;

  CharacterListState({required this.characterList});
}

class InitialState extends CharacterListState {
  InitialState({required super.characterList});
}

class CharacterListLoadedState extends CharacterListState {
  final List<Character> characterFromDBList;

  CharacterListLoadedState({
    required super.characterList,
    required this.characterFromDBList,
  });
}

class LoadData extends CharacterListLoadedState {
  LoadData({required super.characterList, required super.characterFromDBList});
}
