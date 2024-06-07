import 'package:flutter/material.dart';
import 'package:my_movie_box/features/popular_movies/presentation/pages/popular_movies_page.dart';
import 'package:my_movie_box/features/popular_movies/presentation/pages/watch_list_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  final pages = const [PopularMoviesPage(), WatchListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavigationBar(appBarDestinations),
      body: IndexedStack(
        index: destIndex,
        children: pages,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.black,
      shadowColor: Colors.black,
      title: const Text(
        "My Movie Box",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ))
      ],
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
