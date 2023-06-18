import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

import '../../Services/Sprint3/infoChaza_services.dart';

class InfoChazaVista extends StatefulWidget {
  const InfoChazaVista({super.key});

  @override
  State<InfoChazaVista> createState() => _InfoChazaVistaState();
}

class _InfoChazaVistaState extends State<InfoChazaVista> {
  String chaza = "";

  @override
  Widget build(BuildContext context) {
    chaza = ModalRoute
        .of(context)
        ?.settings
        .arguments as String;
    return Scaffold(
      backgroundColor: colorBackground,
      body: Column(children: [
        barraConfiguracion_(),
        const SizedBox(
          height: 15,
        ),
        FutureBuilder(future: getChaza(chaza), builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return informacion_(
                snapshot.data?['nombre'], snapshot.data?['descripcion'],
                snapshot.data?['paga'], snapshot.data?['ubicacion'],
                snapshot.data?['puntuacion'], snapshot.data?['imagen']);
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }))
      ]),
    );
  }

  Stack barraConfiguracion_() {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Stack(children: [
      Container(
        color: colorPrincipal,
        height: screenHeight * 0.11,
        width: screenWidth,
        child: Align(
          alignment: Alignment.bottomLeft,
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

  Column informacion_(String nombre, String descripcion, String pago,
      String ubicacion, String puntuacion, String imagen) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final screenHeight = screenSize.height;
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
            height: screenHeight * 0.38,
          ),
        ),
        SizedBox(height: screenHeight*0.015,),
        nombreyPago(nombre, pago),
        SizedBox(height: screenHeight*0.01,),
        rowUbicacion_(ubicacion),
        Divider(thickness: 1.3),
        rowPuntuacion_(puntuacion),
        Divider(thickness: 1.3),
        SizedBox(height: 1.8,),
        _descripcion(descripcion)
      ],
    );
  }

  Row nombreyPago(String nombre, String pago) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          nombre,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 31.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
        Text(
          pago,
          style: const TextStyle(
              color: colorTrabajador,
              fontSize: 32.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
        Text("/Hora", style: const TextStyle(
            color: Color(0xff444444),
            fontSize: 18.0,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal),)
      ],
    );
  }

  Row rowUbicacion_(String ubicacion) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final screenWidth = screenSize.width;
    //row para juntar el icono y el texto
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: screenWidth*0.02),
        const Icon(Icons.location_on_rounded,
            color: Color(0xff919191), size: 17.0),
        Text(
          ubicacion,
          style: const TextStyle(
              color: Color(0xff919191),
              fontSize: 15.5,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Row rowPuntuacion_(String puntuacion) {
    //row para juntar el icono y el texto
    final screenSize = MediaQuery
        .of(context)
        .size;
    final screenWidth = screenSize.width;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: screenWidth*0.02),
        const Icon(
          Icons.star,
          color: colorChazero,
          size: 26.0,
        ),
        Text(
          puntuacion,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 19.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Column _descripcion(String descripcion){
    final screenSize = MediaQuery
        .of(context)
        .size;
    final screenWidth = screenSize.width;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,
        children: [SizedBox(width: screenWidth*0.02),Text('Descripcion',
          style: const TextStyle(
              color: Colors.black,
              fontSize: 23.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),)],),
        Text(
          descripcion,
          maxLines: null,
          textAlign: TextAlign.center
          ,style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFamily: "Inder"
          ),
        )
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