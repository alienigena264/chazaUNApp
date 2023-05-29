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
      info.add(docSnapshot.get('contraseña'));
      info.add(docSnapshot.get('correo'));
      info.add(docSnapshot.get('numero'));
      info.add(docSnapshot.get('primer_apellido'));
      info.add(docSnapshot.get('primer_nombre'));
      info.add(docSnapshot.get('segundo_apellido'));
      info.add(docSnapshot.get('segundo_nombre'));
    } else {}
  } catch (e) {
    // ignore: avoid_print
    print('Error al obtener el documento: $e');
  }
  return info;
}

Future<void> actualizarDatosTrabajador(String? uid, correoActual, contrasena, telefono,
    pApellido, pNombre, sApellido, sNombre) async {
  await db.collection('Chazero').doc(uid).set({
    'contraseña': contrasena,
    'correo': correoActual,
    'numero': telefono,
    'primer_apellido': pApellido,
    'primer_nombre': pNombre,
    'segundo_apellido': sApellido,
    'segundo_nombre': sNombre
  });
}
