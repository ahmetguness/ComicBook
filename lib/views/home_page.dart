import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:comicappcode/controllers/theme/color_constant.dart';
import 'package:comicappcode/views/all_categories.dart';
import 'package:comicappcode/views/favs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentTab = 0;
  Widget _currentScreen = CategorysScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorConstants.kirmizi,
        child: const Icon(
          Icons.dark_mode_outlined,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 12,
        icons: const [
          Icons.category_outlined,
          Icons.favorite_border_outlined,
        ],
        iconSize: 30,
        inactiveColor: ColorConstants.gri,
        activeColor: ColorConstants.beyaz,
        backgroundColor: ColorConstants.kirmizi,
        activeIndex: _currentTab,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        // ignore: avoid_types_as_parameter_names
        onTap: (int) {
          setState(() {
            _currentTab = int;
            _currentScreen =
                (int == 0) ? CategorysScreen() : const FavoritesScreen();
          });
        },
      ),
    );
  }
}
