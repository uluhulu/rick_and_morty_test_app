import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_app/presentation/character_list_page/character_list_page.dart';
import 'package:rick_and_morty_test_app/presentation/favourites_page/favourites_page.dart';

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
            icon: Badge(child: Icon(Icons.star_outline_outlined)),
            selectedIcon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
      body: screens[currentPageIndex],
    );
  }
}
