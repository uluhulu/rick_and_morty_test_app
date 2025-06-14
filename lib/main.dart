import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_test_app/home/data/models/character_model.dart';
import 'package:rick_and_morty_test_app/home/data/repositories/characters_repository.dart';
import 'package:rick_and_morty_test_app/favorites/domain/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/home/domain/repositories/hive_character_repository.dart';
import 'package:rick_and_morty_test_app/home/domain/repositories/main_character_repository.dart';
import 'package:rick_and_morty_test_app/home/domain/repositories/network_character_repository.dart';
import 'package:rick_and_morty_test_app/main/domain/repositories/theme_repository.dart';
import 'package:rick_and_morty_test_app/home/presentation/character_list_page/character_list_cubit/character_list_cubit.dart';
import 'package:rick_and_morty_test_app/main/presentation/main_page/main_page.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:rick_and_morty_test_app/main/presentation/main_page/theme_cubit/theme_cubit.dart';
import 'package:rick_and_morty_test_app/main/presentation/main_page/theme_cubit/theme_state.dart';
import 'package:rick_and_morty_test_app/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path.getApplicationDocumentsDirectory();

  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(CharacteModelAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(ThemeRepository())..loadTheme(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: state.themeMode,
            theme: state.themeData,
            home: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => DatabaseCubit()),
                BlocProvider(
                  create:
                      (context) => CharacterListCubit(
                        charactersRepository: MainCharacterRepository(
                          hiveCharacterRepository: HiveCharacterRepository(
                            boxName: boxKey,
                          ),
                          networkCharacterRepository:
                              NetworkCharacterRepository(),
                        ),
                        databaseController: DatabaseCubit(),
                      ),
                ),
              ],
              child: MainPage(),
            ),
          );
        },
      ),
    );
  }
}
