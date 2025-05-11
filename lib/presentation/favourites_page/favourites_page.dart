import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_state.dart';
import 'package:rick_and_morty_test_app/presentation/favourites_page/favorite_page_cubit/favorite_page_cubit.dart';
import 'package:rick_and_morty_test_app/presentation/favourites_page/favorite_page_cubit/favorite_page_state.dart';
import 'package:rick_and_morty_test_app/presentation/widgets/character_card.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) => FavoritePageCubit(
            Provider.of<DatabaseCubit>(context, listen: false),
          ),
      child: BlocListener<DatabaseCubit, DatabaseControllerState>(
        listener: (context, state) {
          if (state is DatabaseChanged) {
            Provider.of<FavoritePageCubit>(
              context,
              listen: false,
            ).updateList(state.characterListFromDB);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Favorites"),
            actions: <Widget>[
              BlocBuilder<FavoritePageCubit, FavoritePageState>(
                builder: (BuildContext context, FavoritePageState state) {
                  return PopupMenuButton<String>(
                    onSelected: (_) {
                      Provider.of<FavoritePageCubit>(
                        context,
                        listen: false,
                      ).sortName();
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: "sort_by_name",
                          child: Text("Сортировать по имени"),
                        ),
                      ];
                    },
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<FavoritePageCubit, FavoritePageState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is FavoriteListLoadedState) {
                var characterList = state.characterList;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: characterList.length,
                  itemBuilder: (context, index) {
                    var character = characterList[index];
                    return CharacterCard(
                      imagePath: character.image,
                      name: character.name,
                      status: character.status,
                      iconWidget: IconButton(
                        onPressed: () async {
                          await Provider.of<DatabaseCubit>(
                            context,
                            listen: false,
                          ).deleteItem(characterList[index].id);
                        },
                        icon: Icon(Icons.star),
                      ),
                    );
                  },
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
