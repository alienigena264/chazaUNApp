import 'package:chazaunapp/view/login_vista.dart';
import 'package:chazaunapp/view/menu_inicial_vista.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<StatefulWidget> createState() => _PaginaInicio();
}

class _PaginaInicio extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MenuInicialVistaView();
            } else {
              return LoginVista();
            }
          }),
    );
  }
}
