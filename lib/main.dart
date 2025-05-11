import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/data/characters_repository.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/presentation/character_list_page/character_list_cubit/character_list_cubit.dart';
import 'package:rick_and_morty_test_app/presentation/favourites_page/favorite_page_cubit/favorite_page_cubit.dart';
import 'package:rick_and_morty_test_app/presentation/main_page/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DatabaseCubit()),
          BlocProvider(
            create:
                (context) => CharacterListCubit(
                  charactersRepository: CharactersRepository(),
                  databaseController: DatabaseCubit(),
                ),
          ),
        ],
        child: MainPage(),
      ),
    );
  }
}
