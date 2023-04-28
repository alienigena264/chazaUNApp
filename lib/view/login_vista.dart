


import 'package:flutter/material.dart';

class LoginVista extends StatefulWidget {
  const LoginVista({super.key});

  @override
  State<LoginVista> createState() => _LoginVistaState();
}

class _LoginVistaState extends State<LoginVista> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color(0xffF6F6F6),
      child: Stack(
      children: [
      // Contenedor con texto y fondo
      SizedBox(
        height: 186.0,
        child: Container(
          decoration: const BoxDecoration(
            color:  Color(0xff00B5C0), // Establece el color de fondo del contenedor con el texto
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
            ),
          ),
          child: const Center(
            child:  FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Ingresar', // el texto que quieres mostrar
                style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 55.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        ),
      ),
      ],
    ),
  );
  }
}