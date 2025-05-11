import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_state.dart';
import 'package:rick_and_morty_test_app/presentation/character_list_page/character_list_cubit/character_list_cubit.dart';
import 'package:rick_and_morty_test_app/presentation/character_list_page/character_list_cubit/character_list_state.dart';
import 'package:collection/collection.dart';
import 'package:rick_and_morty_test_app/presentation/widgets/character_card.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final ScrollController _scrollController = ScrollController();
  late final CharacterListCubit _characterListCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<DatabaseCubit>(context, listen: false).getALLCharacters();
    _characterListCubit = Provider.of<CharacterListCubit>(
      context,
      listen: false,
    );
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        _characterListCubit.loadCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseCubit, DatabaseControllerState>(
      listener: (context, state) {
        if (state is DatabaseChanged) {
          _characterListCubit.updateListFromDB(state.characterListFromDB);
        }
      },
      child: _CharacterListBody(scrollController: _scrollController),
    );
  }
}

class _CharacterListBody extends StatelessWidget {
  const _CharacterListBody({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty Test App')),
      body: BlocBuilder<CharacterListCubit, CharacterListState>(
        builder: (context, state) {
          if (state is InitialState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CharacterListLoadedState) {
            var characterList = state.characterList;
            var characterFromDBList = state.characterFromDBList;

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: characterList.length,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      bool inFav =
                          characterFromDBList.firstWhereOrNull(
                            (element) => element.id == characterList[index].id,
                          ) !=
                          null;
                      var character = characterList[index];
                      return CharacterCard(
                        imagePath: character.image,
                        name: character.name,
                        status: character.status,
                        iconWidget:
                            inFav
                                ? IconButton(
                                  onPressed: () async {
                                    await Provider.of<DatabaseCubit>(
                                      context,
                                      listen: false,
                                    ).deleteItem(characterList[index].id);
                                  },
                                  icon: Icon(Icons.star),
                                )
                                : IconButton(
                                  onPressed: () async {
                                    await Provider.of<DatabaseCubit>(
                                      context,
                                      listen: false,
                                    ).writeToDB(characterList[index]);
                                  },
                                  icon: Icon(Icons.star_outline_outlined),
                                ),
                      );
                    },
                  ),
                ),
                if (state is LoadData)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
