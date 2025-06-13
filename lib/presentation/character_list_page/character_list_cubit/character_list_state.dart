import 'package:rick_and_morty_test_app/data/models/character_model.dart';

abstract class CharacterListState {
  final List<CharacteModel> characterList;

  CharacterListState({required this.characterList});
}

class InitialState extends CharacterListState {
  InitialState({required super.characterList});
}

class CharacterListLoadedState extends CharacterListState {
  final List<CharacteModel> characterFromDBList;

  CharacterListLoadedState({
    required super.characterList,
    required this.characterFromDBList,
  });
}

class LoadData extends CharacterListLoadedState {
  LoadData({required super.characterList, required super.characterFromDBList});
}
