import 'package:rick_and_morty_test_app/data/models/character_model.dart';

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
