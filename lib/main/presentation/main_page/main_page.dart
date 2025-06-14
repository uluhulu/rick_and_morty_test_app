import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_test_app/home/presentation/character_list_page/character_list_page.dart';
import 'package:rick_and_morty_test_app/favorites/presentation/favourites_page/favourites_page.dart';
import 'package:rick_and_morty_test_app/main/presentation/main_page/theme_cubit/theme_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  final screens = [CharacterListPage(), FavouritesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outline_outlined),
            selectedIcon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
      body: screens[currentPageIndex],
    );
  }
}
