import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getEmail() async {
  List email = [];
  CollectionReference collectionReferenceEmail = db.collection('Chazero');
  //nos trae todos los documentos
  QuerySnapshot querySnapshotEmail = await collectionReferenceEmail.get();

  //recorremos los documentos
  for (var doc in querySnapshotEmail.docs) {
    email.add(doc.data());
  }
  return email;
}
