import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore db;

  FirestoreService(this.db);

  Future<String> add(Map<String, dynamic> data) async {
    // Add a new document with a generated ID
    final document = await db.collection('dwaween').add(data);
    return document.id;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDwaween() {
    return db.collection('dwaween').snapshots();
  }
}
