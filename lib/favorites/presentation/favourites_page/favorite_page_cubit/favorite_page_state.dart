import 'package:rick_and_morty_test_app/favorites/favorites.dart';

sealed class FavoritePageState {}

class LoadingState extends FavoritePageState {}

class FavoriteListLoadedState extends FavoritePageState {
  final List<CharacteModel> characterList;

  FavoriteListLoadedState({required this.characterList});
}
