import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GAuthService {
  //Ingresar por Google
  ingresarGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
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
}
//correo de la cuenta
//(_currentUser?.email);
//nombre
//(_currentUser?.displayName);
//foto de la cuenta
//GoogleUserCircleAvatar.sizeDirective(_currentUser);
