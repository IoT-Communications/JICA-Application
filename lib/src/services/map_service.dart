import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MapService with ChangeNotifier {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Stream> getAllWatches() async {
    await _firebaseStorage.ref().child('watches');
  }
}
