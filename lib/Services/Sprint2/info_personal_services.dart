import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> actualizarNombreChazero(
    String? uid, primerNombre, segundoNombre) async {
  await db
      .collection('Chazero')
      .doc(uid)
      .set({'primer_nombre': primerNombre, 'segundo_nombre': segundoNombre});
}

Future<void> actualizarApellidoChazero(
    String? uid, primerApellido, segundoApellido) async {
  await db.collection('Chazero').doc(uid).set(
      {'primer_apellido': primerApellido, 'segundo_apellido': segundoApellido});
}

Future<void> actualizarTelefonoChazero(
    String? uid, numeroActual) async {
  await db.collection('Chazero').doc(uid).set(
      {'numero': numeroActual,});
}

Future<void> actualizarEmailChazero(
    String? uid, correoActual) async {
  await db.collection('Chazero').doc(uid).set(
      {'correo': correoActual,});
}
