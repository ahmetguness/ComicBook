import 'package:comicappcode/controllers/theme/color_constant.dart';
import 'package:comicappcode/model/model.dart';
import 'package:comicappcode/views/selected_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  final Category listedCategory;
  const CategoryItems({required this.listedCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          "assets/categories/${listedCategory.category_photo}",
          width: 64,
          height: 64,
        ),
        title: Text(
          listedCategory.category_name.toString().toUpperCase(),
        ),
        trailing: const Icon(
          Icons.open_in_full_outlined,
          color: ColorConstants.kirmizi,
        ),
        onTap: () => Get.to(() => SelectedCategory(selectedCategory: listedCategory),),
      ),
    );
  }
}