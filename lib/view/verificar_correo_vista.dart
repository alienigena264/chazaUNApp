import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';
import 'colors.dart';
import 'menu_inicial_chazero_vista.dart';

class verificacionEmail extends StatefulWidget{

  verificacionEmail({super.key});
  State<verificacionEmail> createState() => verificacionEmailState();
}

class verificacionEmailState extends State<verificacionEmail> {

  bool verificado = false;
  Timer? timer;
  String? correo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    correo = auth.currentUser?.email;
    auth.currentUser?.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 2),
            (_) => verificarCorreo());
  }

  @override
  dispose() {
    super.dispose();
    timer?.cancel();
  }


  verificarCorreo() async {
    await auth.currentUser?.reload();
    setState(() {
      verificado = auth.currentUser!.emailVerified;
    });
    if (verificado){
      await goMenu();
    }
  }
  @override
  Widget build(BuildContext context) {


    return Container(
      color: colorBackground,
      child: Column(
        children: [
          Text(
            """Te acabamos de enviar un correo a $correo para verificar la validez
            del correo ingresado.""",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontFamily: "Inder"
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  goMenu() async {
    //Vuelve al inicio y borra lo anterior(login, registro y trabajador) para que no se pueda regresar al registro una vez ingresado,
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const MenuChazeroVista(),
      ),
      //Esta funcion es para decidir hasta donde hacer pop, ej: ModalRoute.withName('/'));, como está ahí borra todoo
          (_) => false,
    );
  }
}