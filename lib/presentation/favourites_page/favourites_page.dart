import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_cubit.dart';
import 'package:rick_and_morty_test_app/database/database_controller/database_controller_state.dart';
import 'package:rick_and_morty_test_app/presentation/favourites_page/favorite_page_cubit/favorite_page_cubit.dart';
import 'package:rick_and_morty_test_app/presentation/favourites_page/favorite_page_cubit/favorite_page_state.dart';

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
                      return {'Сортировать по имени'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
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
                    return Card(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  characterList[index].image,
                                ),
                              ),
                              Text(characterList[index].name),
                              Text(characterList[index].status),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () async {
                                await Provider.of<DatabaseCubit>(
                                  context,
                                  listen: false,
                                ).deleteItem(characterList[index].id);
                              },
                              icon: Icon(Icons.star),
                            ),
                          ),
                        ],
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
