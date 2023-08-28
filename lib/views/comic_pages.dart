import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComicPages extends StatelessWidget {
  List<String> pages;

  ComicPages({Key? key, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          String photoUrl = pages[index];
          return Column(
            children: [
              Image.network(photoUrl),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
