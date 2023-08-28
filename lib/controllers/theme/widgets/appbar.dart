import 'package:appbar_animated/appbar_animated.dart';
import 'package:comicappcode/controllers/theme/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildScaffoldLayoutBuilder(BuildContext context, String title,
    Widget Function(BuildContext, ColorAnimated, String) appBarBuilder,
    {String? imageAsset}) {
  return ScaffoldLayoutBuilder(
    backgroundColorAppBar:
        const ColorBuilder(Colors.transparent, ColorConstants.kirmizi),
    textColorAppBar: const ColorBuilder(ColorConstants.beyaz),
    appBarBuilder: (context, colorAnimated) =>
        appBarBuilder(context, colorAnimated, title),
    child: SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            imageAsset ?? "assets/categories/appbar.jpg",
            width: Get.width,
            height: Get.height / 2.5,
            fit: BoxFit.fitWidth,
          ),
          Container(
            height: 28,
          ),
        ],
      ),
    ),
  );
}

Widget buildAppBar(
    BuildContext context, ColorAnimated colorAnimated, String title) {
  return AppBar(
    backgroundColor: colorAnimated.background,
    centerTitle: true,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        color: colorAnimated.color,
      ),
    ),
  );
}
