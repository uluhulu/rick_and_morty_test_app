import 'package:rick_and_morty_test_app/home/data/models/character_model.dart';

abstract class FavoritePageState {}

class LoadingState extends FavoritePageState {}

class FavoriteListLoadedState extends FavoritePageState {
  final List<CharacteModel> characterList;

  FavoriteListLoadedState({required this.characterList});
}
