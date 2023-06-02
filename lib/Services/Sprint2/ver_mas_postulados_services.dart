import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> getinfo(uid) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccion = db.collection('Trabajador');
  DocumentSnapshot docSnapshot = await coleccion.doc(uid).get();
  return docSnapshot.data() as Map<String, dynamic>;
}
