//Titulo del banner
import 'package:chazaunapp/Controller/contactanos_controller.dart';
import 'package:chazaunapp/Services/services_contactanos.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

const String _title = 'Contáctanos';
String? preguntas_;

class ContactanosView extends StatefulWidget {
  const ContactanosView({super.key});

  @override
  State<ContactanosView> createState() => _ContactanosState();
}

class _ContactanosState extends State<ContactanosView> {
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    preguntasController.addListener(preguntas);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    preguntasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //cuando salga el teclado que no se reorganize la pagina
        resizeToAvoidBottomInset: false,
        body: Container(
            color: colorBackground,
            alignment: Alignment.center,
            child: Column(children: [
              const Title(), //Banner azul
              Padding(
                padding: const EdgeInsets.all(40),
                child: TextField(
                    maxLines: 10,
                    controller: preguntasController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorFondoField,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      labelStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: "Inder",
                          fontWeight: FontWeight.normal),
                    )),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Expanded(
                  child: Text(
                    "Tu inquietud será respondida en un correo electrónico en menos de 10 días hábiles",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Inder",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorChazero,
                      minimumSize: const Size(340,
                          55), // double.infinity is the width and 30 is the height
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0)),
                    ),
                    onPressed: () => {},
                    child: const Text(
                      "Enviar",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
              ),
            ])));
  }
}

preguntas() {
  preguntas_ = preguntasController.text;
}

enviarSolicitud() {
  final pregunta = preguntas as String;
  if (pregunta.isNotEmpty) {
    enviarDatos(pregunta);
  }
}

class Title extends StatelessWidget {
  const Title({super.key});
// Banner azulito bonito xd
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 186.0,
      child: Container(
        decoration: const BoxDecoration(
          color: colorPrincipal,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
          ),
        ),
        child: const Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _title, // el texto que quieres mostrar
              style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 50.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}