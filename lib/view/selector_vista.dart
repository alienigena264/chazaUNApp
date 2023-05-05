import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class SelectorVista extends StatelessWidget {
  const SelectorVista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Text(
                    'Registrarse como:',
                    style: TextStyle(
                        color: colorPrincipal, fontSize: 26, fontFamily: "Inder"),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              trabajadorButton(context),
              const SizedBox(
                height: 88,
              ),
              chazeroButton(context),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton trabajadorButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorTrabajador,
        minimumSize:
        const Size(316, 55), // double.infinity is the width and 30 is the height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      onPressed: registrarseTrabajador(context),
      child: const Text(
        "TRABAJADOR",
        style: TextStyle(color: colorBackground, fontSize: 24, fontFamily: "Inder"),
      ),
    );
  }

  ElevatedButton chazeroButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorChazero,
        minimumSize:
        const Size(316, 55), // double.infinity is the width and 30 is the height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      onPressed: registrarseChazero(context),
      child: const Text(
        "CHAZERO",
        style: TextStyle(color: colorBackground, fontSize: 24, fontFamily: "Inder"),
      ),
    );
  }

  Function() registrarseTrabajador(BuildContext context) {
    return () {
      Navigator.pushNamed(context, '/registro/trabajador');
    };
  }

  Function() registrarseChazero(BuildContext context) {
    return () {
      Navigator.pushNamed(context, '/registro/chazero');
    };
  }
}
