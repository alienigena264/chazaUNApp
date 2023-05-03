import 'package:flutter/material.dart';

class MenuChazero extends StatefulWidget {
  const MenuChazero({super.key});

  @override
  State<MenuChazero> createState() => _MenuChazeroState();
}

class _MenuChazeroState extends State<MenuChazero> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              // Contenedor con texto y fondo
              barraSuperior_(),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chazas.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 120,
                    width: MediaQuery.of(context).size.width * 0.8// Altura fija para todas las tarjetas
                  ,child: infoChaza_(chazas[index][0], chazas[index][1], chazas[index][2], chazas[index][3]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

  SizedBox barraSuperior_() {
    return SizedBox(
      height: 186.0,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(
              0xff00B5C0),
          // Establece el color de fondo del contenedor con el texto
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
          ),
        ),
        child: const Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Chazero', // el texto que quieres mostrar
              style: TextStyle(
                  color:
                  Colors.white, // Establece el color del texto
                  fontSize: 55.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

  Card infoChaza_(String nombre, String ubicacion, String puntuacion, String pago) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nombre, // Nombre de la chaza
                    style: TextStyle(
                        color:
                        Color(0xff242424),
                        fontSize: 24.0,
                        fontFamily: "Inder",
                        fontWeight: FontWeight.normal),
                  ),
                  rowUbicacion_(ubicacion),
                  rowPuntuacion_(ubicacion),
                ],
              ),
              columnFotoYPagoChaza_(pago),
            ],
          )
        ],
      ),
    );
  }

  Row rowUbicacion_(String ubicacion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.location_on_rounded, color: Color(0xff919191), size: 16.0),
        Text(
          ubicacion,
          style: TextStyle(
              color:
              Color(0xff919191),
              fontSize: 14.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Row rowPuntuacion_(String puntuacion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.star, color: Color(0xffEFB810), size: 16.0,),
        Text(
          puntuacion,
          style: TextStyle(
              color:
              Color(0xff919191),
              fontSize: 14.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Column columnFotoYPagoChaza_(String pago) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Aqui iría la foto de la chaza sacada de la bd
        Text(
          pago + " / Hora",
          style: TextStyle(
              color:
              Color(0xff7B1FA2),
              fontSize: 13.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
        Icon(Icons.more_horiz, color: Color(0xffEFB810ff919191), size: 24.0,),
      ],
    );
  }

  //Ejemplo para ver si funciona una card por chaza
  List<List<String>> chazas = [
    ["Sex-Chaza", "Frente a humanas", "3.5", "12000"],
    ["Los perros del calvo HP", "Junto al FEM", "5.0", "8000"],
    ["Calcas a 800", "La playita", "4.4", "5000"]
  ];

