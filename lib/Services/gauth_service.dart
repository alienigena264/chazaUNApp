import 'dart:convert';

import 'package:chazaunapp/Components/error_prompt.dart';
import 'package:chazaunapp/view/inicio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GAuthService {
  //Ingresar por Google, bool para registrar o ingresar
  ingresarGoogle(bool registro, String telefono, BuildContext context) async {
    //Ya bloquea desde la consola de Google Cloud, pero esta mas bonito asi xD
    final gUser = await GoogleSignIn(hostedDomain: "unal.edu.co").signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //datos para guardar en firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    if (registro) {
      await FirebaseAuth.instance.signInWithCredential(credential);
      registrarTrabajador(gUser, gAuth, telefono);
    } else {
      FirebaseFirestore db = FirebaseFirestore.instance;
      CollectionReference coleccion = db.collection('Trabajador');
      String email = gUser.email;
      await coleccion
          .where("correo", isEqualTo: email)
          .get()
          .then((querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          try {
            return await FirebaseAuth.instance.signInWithCredential(credential);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'Hubo un error, intenta más tarde.',
              ),
              backgroundColor: Colors.red,
            ));
          }
        } else {
          errorPrompt(context, 'No se encontro el usuario',
              'Por favor registrese primero');
        }
      });
    }
  }

  registrarTrabajador(GoogleSignInAccount gUser,
      GoogleSignInAuthentication gAuth, String telefono) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference coleccion = db.collection('Trabajador');
    DateTime fechaHoy = DateTime.now();
    String email = gUser.email;
    Map<String, dynamic>? idMap = parseJwt(gAuth.idToken!);
    final String firstName = idMap!["given_name"];
    final String lastName = idMap["family_name"];
    final String? foto = gUser.photoUrl;
    await coleccion
        .where("correo", isEqualTo: email)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        final data = {
          "correo": email,
          "nombres": firstName,
          "apellidos": lastName,
          "estado": true,
          "telefono": telefono,
          "foto": foto,
          "FechaCreacion":fechaHoy,
          "FechaUltimaActualizacion":fechaHoy
        };
        coleccion.doc(FirebaseAuth.instance.currentUser?.uid).set(data);
      }
    });
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

//lo encontre en internet para conseguir nombres y apellidos separados
  static Map<String, dynamic>? parseJwt(String token) {
    // validate token
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

  //Nombre de la cuenta
  // Es mejor usar la info de la base de datos
  getNombreCompleto() {
    String? nombre = FirebaseAuth.instance.currentUser?.displayName;
    if (nombre == null) {
      //print('e');
    } else {
      return nombre;
    }
  }

  //email registrado
  getEmail() {
    return FirebaseAuth.instance.currentUser!.email;
  }
}
