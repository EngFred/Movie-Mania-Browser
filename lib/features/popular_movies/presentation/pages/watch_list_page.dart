import 'package:flutter/material.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "My watch list",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
