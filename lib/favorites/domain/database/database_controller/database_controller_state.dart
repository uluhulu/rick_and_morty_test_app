import 'package:rick_and_morty_test_app/favorites/favorites.dart';

abstract class DatabaseControllerState {
  final List<CharacteModel> characterListFromDB;

  DatabaseControllerState({required this.characterListFromDB});
}

class DatabaseInitialState extends DatabaseControllerState {
  DatabaseInitialState({required super.characterListFromDB});
}

class DatabaseChanged extends DatabaseControllerState {
  DatabaseChanged({required super.characterListFromDB});
}
