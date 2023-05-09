import 'package:flutter/material.dart';

import 'colors.dart';

class RegistroChazeroVista extends StatefulWidget {
  const RegistroChazeroVista({super.key});

  @override
  State<RegistroChazeroVista> createState() => _RegistroChazeroVistaState();
}



class _RegistroChazeroVistaState extends State<RegistroChazeroVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SingleChildScrollView(
          child: Container(
        color: colorBackground,
        child: Column(
          children: [
            Stack(
              children: [
                // Contenedor con texto y fondo
                barraSuperior_(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            largeInput("Correo", Icons.mail, false, TextInputType.emailAddress),
            largeInput("Contraseña", Icons.password, true, TextInputType.name),
            shortInput("Primer Nombre", "Segundo Nombre"),
            shortInput("Primer Apellido", "Segundo Apellido"),
            largeInput("Telefono", Icons.phone, false, TextInputType.phone),
            //aca debe ir el de confirmar
            const SizedBox(height: 40),
            inicioSesionButtom_()
            
          ],
        ),
      )),
    );
  }

  Row shortInput(String primerCampo, String segundoCampo) {
    return Row(
      children: [
        miniButom(30, 20, primerCampo),
        miniButom(10, 30, segundoCampo),
      ],
    );
  }

  Expanded miniButom(double paddingIzq, double paddingDer, String campo) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.only(left: paddingIzq, right: paddingDer, top: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: colorFondoField,
              labelText: campo,
              labelStyle: TextStyle(color: Colors.grey.shade700),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      );
  }

  Container largeInput(
      String label, IconData dibujo, bool oculto, TextInputType teclado) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextField(
        keyboardType: teclado,
        obscureText: oculto,
        decoration: InputDecoration(
          filled: true,
          fillColor: colorFondoField,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          suffixIcon: Icon(dibujo),
        ),
      ),
    );
  }

  SizedBox barraSuperior_() {
    return SizedBox(
      height: 186.0,
      child: Container(
        decoration: const BoxDecoration(
          color:
              colorPrincipal, // Establece el color de fondo del contenedor con el texto
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
        ),
        child: const Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'CHAZERO', // el texto que quieres mostrar
              style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 64.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
  
  ElevatedButton inicioSesionButtom_() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorChazero,
          minimumSize: const Size(340, 55), // double.infinity is the width and 30 is the height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0)
          ),
        ),
        onPressed: registrar_(),
        child: const Text(
          "Iniciar sesión",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18
          ),
        )
      );
  }

  registrar_() {
    return () {
      Navigator.pushNamed(context, '/menu/chazero');
    };
  }
}
