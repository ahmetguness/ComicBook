import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';

class FirebaseService {
  static Future<List<String>> fetchFolderNames(String path) async {
    try {
      firebase_storage.ListResult result =
          await firebase_storage.FirebaseStorage.instance
              .ref('comic/$path')
              .listAll();
      return result.prefixes.map((folder) => folder.name).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return [];
    }
  }

   static Future<List<String>> fetchPhotos(String categoryName, String comicName, int issue) async {
    try {
      firebase_storage.ListResult result =
          await firebase_storage.FirebaseStorage.instance
              .ref('comic/$categoryName/$comicName/$comicName # $issue')
              .listAll();

      List<String> photoUrls = [];

      for (var photo in result.items) {
        if (photo.name.endsWith('.jpg')) {
          String photoUrl = await photo.getDownloadURL();
          photoUrls.add(photoUrl);
        }
      }

      return photoUrls;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return [];
    }
  }

  static Future<String?> fetchCoverPhoto(String categoryName, String comicName) async {
    try {
      String coverPath = 'comic/$categoryName/$comicName/cover.jpg';
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref(coverPath);

      // Fotoğrafın var olup olmadığını kontrol etmek için getMetadata kullanıyoruz.
      firebase_storage.FullMetadata metadata = await ref.getMetadata();
      // ignore: unnecessary_null_comparison
      if (metadata != null) {
        String coverUrl = await ref.getDownloadURL();
        return coverUrl;
      } else {
        if (kDebugMode) {
          print('Fotoğraf bulunamadı.');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Hata: $e');
      }
      return null;
    }
  }

  static Future<String?> fetchFirstPhoto(String categoryName, String comicName, int issue) async {
  try {
    firebase_storage.ListResult result =
        await firebase_storage.FirebaseStorage.instance
            .ref('comic/$categoryName/$comicName/$comicName # $issue')
            .list();

    if (result.items.isNotEmpty) {
      firebase_storage.Reference firstPhoto = result.items.first;
      String firstPhotoUrl = await firstPhoto.getDownloadURL();
      return firstPhotoUrl;
    } else {
      return null;
    }
  } catch (e) {
    if (kDebugMode) {
      print('Hata: $e');
    }
    return null;
  }
}



}
