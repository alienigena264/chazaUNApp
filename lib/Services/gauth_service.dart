import 'package:chazaunapp/view/inicio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GAuthService {
  //Ingresar por Google
  ingresarGoogle() async {
    //Ya bloquea desde la consola de Google Cloud, pero esta mas bonito asi xD
    final gUser = await GoogleSignIn(hostedDomain: "unal.edu.co").signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //datos para guardar en firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //ingresar en firebase
    await FirebaseAuth.instance.signInWithCredential(credential);

    // guardar en firebase firestore
    await registrarTrabajador(gUser);

  }

//NO FUNCIONA XD
  registrarTrabajador(GoogleSignInAccount gUser) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference coleccion = db.collection('Trabajador');
    bool emailExists = await coleccion
        .where("correo", isEqualTo: gUser.email)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      }
      return false;
    });


    if (!emailExists) {
      final data = {
        "correo": gUser.email,
        "nombre": gUser.displayName,
        "estado": true,
        "numero": gUser.photoUrl,
      };

      // añade el usuario a la coleccion usando el uid de fire auth
      coleccion.doc(FirebaseAuth.instance.currentUser?.uid).set(data);
    }
  }

  salirDeGoogle(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    return () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const PaginaInicio(),
        ),
        //Esta funcion es para decidir hasta donde hacer pop, ej: ModalRoute.withName('/'));, como está ahí borra todoo
        (_) => false,
      );
    };
  }

  /*no funciono xd
//lo encontre en internet para conseguir nombres y apellidos separados
  static Map<String, dynamic>? parseJwt(String token) {
    // validate token
    if (token == null) return null;
    final List<String> parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }
    // retrieve token payload
    final String payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(normalized));
    // convert to Map
    final payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }
    return payloadMap;
  }

  /* Para ingresarlo a google
    Map<String, dynamic>? idMap = parseJwt(gUser!.id);

    final String firstName = idMap!["given_name"];
    final String lastName = idMap["family_name"];*/


  static Future<String?> getNombre(String user) async {
    //final GoogleSignInAuthentication gAuth =
    //  await FirebaseAuth.instance.currentUser?.getIdToken();
    print(user);
    Map<String, dynamic>? idMap = parseJwt(user);
    print(idMap!["given_name"]);
    return idMap["given_name"];
  }

  Future<String?> getApellido() async {
    String? user = await FirebaseAuth.instance.currentUser?.getIdToken();
    Map<String, dynamic>? idMap = parseJwt(user!);
    return await idMap!["family_name"];
    print('e2');
  }
*/
  //Nombre de la cuenta
  getNombreCompleto() {
    String? nombre = FirebaseAuth.instance.currentUser?.displayName;
    if (nombre == null) {
      print('e');
    } else {
      return nombre;
    }
  }

  //email registrado
  getEmail() {
    return FirebaseAuth.instance.currentUser!.email;
  }

  //foto que tenga en google
  getProfilePic() {
    try {
      return FirebaseAuth.instance.currentUser!.photoURL;
    } catch (e) {
      return "no hay usuario";
    }
  }
}
//foto de la cuenta
//GoogleUserCircleAvatar.sizeDirective(_currentUser);
