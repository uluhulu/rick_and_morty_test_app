import 'package:rick_and_morty_test_app/domain/character.dart';

abstract class FavoritePageState {}

class LoadingState extends FavoritePageState {}

class FavoriteListLoadedState extends FavoritePageState {
  final List<Character> characterList;

  FavoriteListLoadedState({required this.characterList});
}
