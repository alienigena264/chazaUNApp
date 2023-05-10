import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

late final GoogleSignInAccount? gUser;

class GAuthService {
  //Ingresar por Google
  Future<UserCredential> ingresarGoogle() async {
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
