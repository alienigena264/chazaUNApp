import 'package:flutter/material.dart';

import '../Services/gauth_service.dart';
import '../view/menu_inicial_vista.dart';

//Verificación de los terminos y condiciones
bool isChecked = true;

class BotonGoogle extends StatefulWidget {
  const BotonGoogle({super.key});
  @override
  State<BotonGoogle> createState() => _BotonGoogle();
}

class _BotonGoogle extends State<BotonGoogle> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4285F4),
          minimumSize: const Size(
              340, 55), // double.infinity is the width and 30 is the height
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        ),
        onPressed: () async {
          if (isChecked) {
            try {
              await GAuthService().ingresarGoogle();
              await goMenu();
            } catch (e) {
              print('ingresa con cuenta unal');
            }
          } else {
            print('No ha aceptado');
          }
        },
        child: Row(mainAxisSize: MainAxisSize.min, children: const [
          Text(
            "Ingresar con google unal",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ]));
  }

  //async para esperar el ingreso
  goMenu() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MenuInicialVistaView()));
  }
}
