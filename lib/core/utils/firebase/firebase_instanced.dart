import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseInstance {
    final FirebaseAuth auth = FirebaseAuth.instance; 
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance; 
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance; 
}