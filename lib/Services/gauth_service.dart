import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

late final GoogleSignInAccount? gUser;

class GAuthService {
  //Ingresar por Google
  ingresarGoogle() async {
    //Ya bloquea desde la consola de Google Cloud, pero esta mas bonito asi xD
    gUser = await GoogleSignIn(hostedDomain: "unal.edu.co").signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //datos para guardar en firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //ingresar en firebase
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  salirDeGoogle() async {
    return await FirebaseAuth.instance.signOut();
  }

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

  //Nombre de la cuenta
  getUser() {
    if (gUser?.displayName != null) {
      return gUser?.displayName;
    } else {
      return "no hay usuario";
    }
  }

  //email registrado
  getEmail() {
    if (gUser?.email != null) {
      return gUser?.email;
    } else {
      return "no hay usuario";
    }
  }

  //foto que tenga en google
  getProfilePic() {
    try {
      return gUser?.photoUrl;
    } catch (e) {
      return "no hay usuario";
    }
  }
}
//foto de la cuenta
//GoogleUserCircleAvatar.sizeDirective(_currentUser);
