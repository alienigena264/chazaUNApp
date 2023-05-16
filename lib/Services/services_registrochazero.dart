import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference collectionReferenceEmail = db.collection('Chazero');

Future<bool> emailExists(String? text) async {
  //nos trae todos los documentos
  //recorremos los documentos
  // ignore: avoid_function_literals_in_foreach_calls

  final emailsExisting = await auth.fetchSignInMethodsForEmail(text!);

  if (emailsExisting.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

void crearChazeroEnBD(String correo, String contrasena, String primerNombre,
  String segundoNombre, String primerApellido, String segundoApellido,
    String numero){

  final data = {"correo": correo, "contraseña": contrasena,
    "primer_nombre": primerNombre, "segundo_nombre": segundoNombre,
    "primer_apellido": primerApellido, "segundo_apellido": segundoApellido,
    "numero": numero};

  collectionReferenceEmail.add(data).then((documentSnapshot) =>
      print("Added Data with ID: ${documentSnapshot.id}"));
}