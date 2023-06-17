import 'package:auto_size_text/auto_size_text.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class InfoChazaVista extends StatefulWidget {
  const InfoChazaVista({super.key});

  @override
  State<InfoChazaVista> createState() => _InfoChazaVistaState();
}

class _InfoChazaVistaState extends State<InfoChazaVista> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: colorBackground,
      body: Column(children: [
        barraConfiguracion_(),
        const SizedBox(
          height: 15,
        ),
       ]),
    );
  }

  Stack barraConfiguracion_() {
    return Stack(children: [
      Container(
        color: colorPrincipal,
        height: 85,
        width: 500,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            volverBoton_(),
            const Text(
              "Informacion de la chaza",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )
          ]),
        ),
      ),
    ]);
  }

  Column informacion_(String nombre, String descripcion, String pago, String ubicacion, String puntuacion, String imagen){
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          // Contenedor para que la imagen tenga borde redondeado
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: NetworkImage(imagen),
            //Parametro del enlace de la imagen de la chaza
            height: screenHeight * 0.4,
          ),
        ),
        nombreyPago(nombre, pago),
        rowUbicacion_(ubicacion),
        Divider(thickness: 1),
        rowPuntuacion_(puntuacion),
        Divider(thickness: 1)
      ],
    );
  }

  Row nombreyPago(String nombre, String pago){
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: screenHeight * 0.05,
          width: screenWidth * 0.35,
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: AutoSizeText(
            nombre, // Nombre de la chaza
            style: const TextStyle(
              color: Color(0xff242424),
              fontSize: 27.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal,
            ),
            maxLines:
            1, // Define el número máximo de líneas permitidas
            overflow: TextOverflow
                .fade, // Define cómo se maneja el desbordamiento del texto
          ),
        ),
        Text(
          pago,
          style: const TextStyle(
              color: colorTrabajador,
              fontSize: 32.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
        Text("/Hora",style:const TextStyle(
            color: Color(0xff444444),
            fontSize: 18.0,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal),)
      ],
    );
  }
  Row rowUbicacion_(String ubicacion) {
    //row para juntar el icono y el texto
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.location_on_rounded,
            color: Color(0xff919191), size: 16.0),
        Text(
          ubicacion,
          style: const TextStyle(
              color: Color(0xff919191),
              fontSize: 14.5,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
  Row rowPuntuacion_(String puntuacion) {
    //row para juntar el icono y el texto
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.star,
          color: colorChazero,
          size: 15.0,
        ),
        Text(
          puntuacion,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
  TextButton volverBoton_() {
    return TextButton(
      onPressed: volverInicio_(),
      child: const Icon(
        Icons.arrow_back,
        size: 35,
        color: Colors.white,
      ),
    );
  }

  volverInicio_() {
    return () {
      //No modificar, esto directamente manda a la anterior ventana
      Navigator.pop(
        context,
      );
    };
  }
}
