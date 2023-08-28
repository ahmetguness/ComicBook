import 'package:comicappcode/controllers/theme/widgets/appbar.dart';
import 'package:comicappcode/controllers/theme/widgets/category_items.dart';
import 'package:comicappcode/model/model.dart';
import 'package:flutter/material.dart';
import '../data/strings.dart';

// ignore: must_be_immutable
class CategorysScreen extends StatelessWidget {
  late List<Category> allCategories;

  CategorysScreen({super.key}) {
    allCategories = prepData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildScaffoldLayoutBuilder(context, "Kategoriler", buildAppBar),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CategoryItems(listedCategory: allCategories[index]);
              },
              itemCount: Strings.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}

List<Category> prepData() {
  List<Category> temp = [];

  for (int i = 0; i < Strings.categories.length; i++) {
    // ignore: non_constant_identifier_names
    Category category_to_add =
        Category(Strings.categories[i], "${Strings.categories[i]}.jpg");
    temp.add(category_to_add);
  }

  return temp;
}
