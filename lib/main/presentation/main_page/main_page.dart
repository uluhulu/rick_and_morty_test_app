import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_app/favorites/presentation/favourites_page/favourites_page.dart';
import 'package:rick_and_morty_test_app/home/presentation/character_list_page/character_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);
  final screens = [CharacterListPage(), FavouritesPage()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              _pageNotifier.value = index;
            },
            selectedIndex: _pageNotifier.value,
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
          body: screens[_pageNotifier.value],
        );
      },
      valueListenable: _pageNotifier,
    );
  }
}
