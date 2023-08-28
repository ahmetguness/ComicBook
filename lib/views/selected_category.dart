import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme/widgets/appbar.dart';
import '../firebase/firebase_services.dart';
import '../model/model.dart';
import 'issue_of_the_comic.dart';

class SelectedCategory extends StatefulWidget {
  final Category selectedCategory;
  const SelectedCategory({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  List<String> folderNames = [];

  @override
  void initState() {
    super.initState();
    fetchFolderNames();
  }

  void fetchFolderNames() async {
    List<String> names = await FirebaseService.fetchFolderNames(
        widget.selectedCategory.category_name);
    setState(() {
      folderNames = names;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildScaffoldLayoutBuilder(
            context,
            widget.selectedCategory.category_name.toString().toUpperCase(),
            buildAppBar,
            imageAsset:
                // ignore: prefer_interpolation_to_compose_strings
                "assets/selected_category/" +
                    widget.selectedCategory.category_photo,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: folderNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: FutureBuilder<String?>(
                    future: FirebaseService.fetchCoverPhoto(
                      widget.selectedCategory.category_name,
                      folderNames[index],
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Icon(Icons.error);
                      } else if (snapshot.hasData && snapshot.data != null) {
                        return CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!),
                        );
                      } else {
                        return const CircleAvatar(
                          child: Icon(Icons.image_not_supported),
                        );
                      }
                    },
                  ),
                  title: Text(folderNames[index]),
                  onTap: () => Get.to(
                    () => IssueOfTheComic(
                        kategoriAd:
                            widget.selectedCategory.category_name.toString(),
                        crAdi: folderNames[index]),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
