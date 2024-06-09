import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movie_box/features/movies/presentation/pages/movies_page.dart';
import 'package:my_movie_box/features/movies_watchlist/presentation/pages/watch_list_page.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int destIndex = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Popular',
      selectedIcon: Icon(Icons.home_filled),
    ),
    NavigationDestination(
      icon: Icon(Icons.tv_outlined),
      label: 'Watch',
      selectedIcon: Icon(Icons.tv),
    ),
  ];

  final pages = const [MoviesPage(), WatchListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(appBarDestinations),
      body: IndexedStack(
        index: destIndex,
        children: pages,
      ),
    );
  }

  Widget _buildBottomNavigationBar(List<NavigationDestination> destinations) {
    return NavigationBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        shadowColor: Colors.black,
        selectedIndex: destIndex,
        onDestinationSelected: (index) {
          setState(() {
            destIndex = index;
          });
        },
        destinations: destinations);
  }
}
