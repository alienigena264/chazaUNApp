

import 'package:flutter/material.dart';

class ContrasenaVista extends StatefulWidget{
  const ContrasenaVista({super.key});

  @override
  State<ContrasenaVista> createState() => _ContrasenaVistaState();
}

class _ContrasenaVistaState extends State<ContrasenaVista>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: const Color(0xffF6F6F6),
        child: Column(
          children: const [
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
            InputEmailVista(),
            ContinuarButton(),
          ],
        )
      ),
    );
  }
}

class InputEmailVista extends StatefulWidget{
  const InputEmailVista({super.key});

  @override
  State<InputEmailVista> createState() => _InputEmailVistaState();
}

class _InputEmailVistaState extends State<InputEmailVista>{

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 40.0, left: 200.0, right: 200.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: const TextField(
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

class ContinuarButton extends StatefulWidget{
  const ContinuarButton({super.key});

  @override
  State<ContinuarButton> createState() => _ContinuarButton();
}

class _ContinuarButton extends State <ContinuarButton> {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () { },
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