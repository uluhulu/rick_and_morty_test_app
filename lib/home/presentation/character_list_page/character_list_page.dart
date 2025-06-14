import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_test_app/home/data/models/character_model.dart';
import 'package:rick_and_morty_test_app/favorites/domain/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/favorites/domain/database/database_controller/database_controller_state.dart';
import 'package:rick_and_morty_test_app/home/presentation/character_list_page/character_list_cubit/character_list_cubit.dart';
import 'package:rick_and_morty_test_app/home/presentation/character_list_page/character_list_cubit/character_list_state.dart';
import 'package:collection/collection.dart';
import 'package:rick_and_morty_test_app/main/presentation/main_page/theme_cubit/theme_cubit.dart';
import 'package:rick_and_morty_test_app/main/presentation/main_page/theme_cubit/theme_state.dart';
import 'package:rick_and_morty_test_app/widgets/character_card.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  late final CharacterListCubit _characterListCubit;
  late final DatabaseCubit _databaseCubit;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      // Здесь вызываем пагинацию
      _characterListCubit.loadCharacters();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _databaseCubit = Provider.of<DatabaseCubit>(context, listen: false);
    _characterListCubit = Provider.of<CharacterListCubit>(
      context,
      listen: false,
    );

    _databaseCubit.getALLCharacters();

    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseCubit, DatabaseControllerState>(
      listener: (context, state) {
        if (state is DatabaseChanged) {
          _characterListCubit.updateListFromDB(state.characterListFromDB);
        }
      },
      child: _CharacterListBody(_scrollController, _databaseCubit),
    );
  }
}

class _CharacterListBody extends StatelessWidget {
  const _CharacterListBody(this._scrollController, this._databaseCubit);
  final ScrollController _scrollController;
  final DatabaseCubit _databaseCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Test App'),
        leading: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Switch(
              value: state.themeMode == ThemeMode.light,
              onChanged:
                  (_) =>
                      Provider.of<ThemeCubit>(
                        context,
                        listen: false,
                      ).toggleTheme(),
            );
          },
        ),
      ),
      body: BlocBuilder<CharacterListCubit, CharacterListState>(
        builder: (context, state) {
          if (state is InitialState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CharacterListLoadedState) {
            var characterList = state.characterList;
            var characterFromDBList = state.characterFromDBList;

            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              controller: _scrollController,
              itemCount: characterList.length + (state is LoadData ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= characterList.length) {
                  return Center(child: CircularProgressIndicator());
                }
                var character = characterList[index];
                return CharacterCard(
                  imagePath: character.image,
                  name: character.name,
                  status: character.status,
                  iconWidget: getFavIcon(
                    characterFromDBList,
                    characterList,
                    index,
                    _databaseCubit,
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget getFavIcon(
    List<CharacteModel> characterFromDBList,
    List<CharacteModel> characterList,
    int index,
    DatabaseCubit databaseCubit,
  ) {
    bool inFav =
        characterFromDBList.firstWhereOrNull(
          (element) => element.id == characterList[index].id,
        ) !=
        null;
    return inFav
        ? IconButton(
          onPressed: () async {
            await databaseCubit.deleteItem(characterList[index].id);
          },
          icon: Icon(Icons.star),
        )
        : IconButton(
          onPressed: () async {
            await databaseCubit.writeToDB(characterList[index]);
          },
          icon: Icon(Icons.star_outline_outlined),
        );
  }
}
