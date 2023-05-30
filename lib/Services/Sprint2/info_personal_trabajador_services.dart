import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<dynamic>> traerInfoGeneralTrabajo(String? uid) async {
  List<dynamic> info = [];
  try {
    // Obtén una referencia a la colección y documento específicos
    CollectionReference collectionRef = db.collection('Trabajador');
    DocumentSnapshot docSnapshot = await collectionRef.doc(uid).get();

    if (docSnapshot.exists) {
      // Si el documento existe, agrega los campos a la lista
      info.add(docSnapshot.get('apellidos'));
      info.add(docSnapshot.get('correo'));
      info.add(docSnapshot.get('foto'));
      info.add(docSnapshot.get('nombres'));
      info.add(docSnapshot.get('telefono'));
    } else {}
  } catch (e) {
    // ignore: avoid_print
    print('Error al obtener el documento: $e');
  }
  return info;
}

Future<void> actualizarDatosTrabajador(
    String? uid, apellidos, correoActual, foto, nombres, telefono) async {
  await db.collection('Trabajador').doc(uid).set({
    'apellidos': apellidos,
    'correo': correoActual,
    'foto': foto,
    'nombres': nombres,
    'telefono': telefono
  });
}
