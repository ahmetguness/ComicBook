import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  List<String>? downloadURLs;

  Future<List<String>?> getData() async {
    try {
      await downloadURLExample();
      return downloadURLs;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    ListResult listResult = await FirebaseStorage.instance.ref().child("comic/spider-man/Amazing Spider-Man").listAll();
    downloadURLs = [];

    for (Reference ref in listResult.items) {
      String downloadURL = await ref.getDownloadURL();
      if (ref.name.endsWith(".jpg")) {
        downloadURLs!.add(downloadURL);
      }
    }

    debugPrint(downloadURLs.toString());
  }
}