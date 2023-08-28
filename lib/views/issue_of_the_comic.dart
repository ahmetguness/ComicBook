import 'package:comicappcode/views/comic_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme/widgets/appbar.dart';
import '../firebase/firebase_services.dart';

// ignore: must_be_immutable
class IssueOfTheComic extends StatefulWidget {
  String kategoriAd;
  String crAdi;
  IssueOfTheComic({Key? key, required this.kategoriAd, required this.crAdi})
      : super(key: key);

  @override
  State<IssueOfTheComic> createState() => _IssueOfTheComicState();
}

class _IssueOfTheComicState extends State<IssueOfTheComic> {

  List<String> folderNames = [];
  List<String> comicPages = [];
  late String coverUrl;

  @override
  void initState() {
    super.initState();
    fetchFolderNames();
    fetchPhotos();
  }

  void fetchFolderNames() async {
    List<String> names = await FirebaseService.fetchFolderNames(
        "${widget.kategoriAd}/${widget.crAdi}");
    setState(() {
      folderNames = names;
    });
  }

  void fetchPhotos() async {
    List<String> pages = await FirebaseService.fetchPhotos(widget.kategoriAd, widget.crAdi, 1);
    setState(() {
      comicPages = pages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildScaffoldLayoutBuilder(context, widget.crAdi, buildAppBar),
          ListView.builder(
                shrinkWrap: true,
                itemCount: folderNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading:  Image(image: NetworkImage(comicPages.first),),
                      title: Text(folderNames[index]),
                      onTap: () => Get.to(() => ComicPages(pages: comicPages),),
                    ),
                  );
                },
              ),
        ],
      ),
    );
  }
}