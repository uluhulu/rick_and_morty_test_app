import 'package:rick_and_morty_test_app/domain/character.dart';

abstract class CharacterListState {}

class LoadingState extends CharacterListState {}

class CharacterListLoadedState extends CharacterListState {
  final List<Character> characterList;

  CharacterListLoadedState({required this.characterList});
}
