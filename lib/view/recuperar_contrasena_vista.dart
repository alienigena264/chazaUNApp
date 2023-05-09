import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ContrasenaVista extends StatefulWidget{
  const ContrasenaVista({super.key});

  @override
  State<ContrasenaVista> createState() => _ContrasenaVistaState();
}

class _ContrasenaVistaState extends State<ContrasenaVista>{

  final emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: const Color(0xffF6F6F6),
        child: Column(
          children: [
            // Titulo "¿Olvidaste tu Contraseña?
            SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  "¿Olvidaste tu\n contraseña?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontFamily: "Inder"
                  ),
                ),
              ) ,
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Escribe el correo electrónico con\nel que te registraste para poder\n      recuperar tu contraseña",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontFamily: "Inder"
                  ),
                ),
              ) ,
            ),
            InputEmailVista(emailTextController: emailTextController),
            ContinuarButtonVista(emailTextController: emailTextController)
          ],
        )
      ),
    );
  }
}

class InputEmailVista extends StatefulWidget{
  final TextEditingController emailTextController;

  const InputEmailVista({super.key, required this.emailTextController});

  @override
  State<InputEmailVista> createState() => _InputEmailVistaState();
}

class _InputEmailVistaState extends State<InputEmailVista>{



  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 40.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        controller: widget.emailTextController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          hintText: "Correo",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal,
          )
        ),
      ),
    );
  }
}

class ContinuarButtonVista extends StatefulWidget{

  final TextEditingController emailTextController;

  const ContinuarButtonVista({super.key, required this.emailTextController});

  @override
  State<ContinuarButtonVista> createState() => _ContinuarButton();
}

class _ContinuarButton extends State <ContinuarButtonVista> {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () async {
        try{
          await FirebaseAuth.instance.sendPasswordResetEmail(email: widget.emailTextController.text);
        }catch(e){
        print(widget.emailTextController.text);}
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffEFB810),
        minimumSize: const Size(340, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        )
      ),
      child: const Text(
        'Continuar',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18
        ),
      )
    );
  }
}