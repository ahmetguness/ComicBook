import 'package:flutter/material.dart';
import '../controllers/theme/widgets/appbar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
                buildScaffoldLayoutBuilder(context, "Favoriler", buildAppBar),
          ),
        ],
      ),
    );
  }
}
