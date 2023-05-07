import 'package:flutter/material.dart';
import 'package:chazaunapp/view/colors.dart';
//Pruebita pull request

class MenuChazeroVista extends StatefulWidget {
  const MenuChazeroVista({super.key});

  @override
  State<MenuChazeroVista> createState() => _MenuChazeroVistaState();
}

class _MenuChazeroVistaState extends State<MenuChazeroVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: colorBackground,
          child: Column(
            children: [
              Stack(
                children: [
                  barraSuperior_(),
                ],
              ),
              Container(
                height: 550, // Tamaño fijo
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: chazas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 162,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: infoChaza_(
                          chazas[index][0], chazas[index][1], chazas[index][2],
                          chazas[index][3], chazas[index][4]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox barraSuperior_() {
    return SizedBox(
      height: 186.0,
      child: Container(
        decoration: const BoxDecoration(
          color: colorPrincipal,
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
                color: colorBackground, // Establece el color del texto
                fontSize: 35.0, // Establece el tamaño del texto
                fontFamily: "Inder",
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card infoChaza_(String nombre, String ubicacion, String puntuacion,
      String pago, String imagen) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nombre, // Nombre de la chaza
                    style: const TextStyle(
                        color: Color(0xff242424),
                        fontSize: 22.0,
                        fontFamily: "Inder",
                        fontWeight: FontWeight.normal),
                  ),
                  rowUbicacion_(ubicacion),
                  rowPuntuacion_(puntuacion),
                ],
              ),
              columnFotoYPagoChaza_(imagen, pago),
            ],
          ),
          Row( mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                botonHorarios(),
              botonPersonal()
            ],
          )
        ],
      ),
    );
  }

  Row rowUbicacion_(String ubicacion) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        const Icon(Icons.location_on_rounded, color: Color(0xff919191), size: 16.0),
        Text(
          ubicacion,
          style: const  TextStyle(
              color: Color(0xff919191),
              fontSize: 14.5,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Row rowPuntuacion_(String puntuacion) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.star,
          color: colorChazero,
          size: 16.0,
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

  Column columnFotoYPagoChaza_(String imagen, String pago) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          // Ajusta el radio del borde según tus necesidades
          child: Image(
            image: NetworkImage(imagen),
            height: 61.0,
          ),
        ),
        Text(
          "$pago / Hora",
          style: const TextStyle(
              color: colorTrabajador,
              fontSize: 13.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
        const Icon(
          Icons.more_horiz,
          color: Color.fromARGB(255, 143, 143, 143),
          size: 24.0,
        ),
      ],
    );
  }
  ElevatedButton botonHorarios(){
    return ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor:colorChazero,
      minimumSize: const Size(
          132, 39), // double.infinity is the width and 30 is the height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
        onPressed: (){},
        child: const Text(
          "Horarios",
          style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Inder"),
        ));
  }
  ElevatedButton botonPersonal(){
    return ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor: colorChazero,
      minimumSize: const Size(
          132, 39), // double.infinity is the width and 30 is the height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
        onPressed: (){},
        child: const Text(
          "Personal",
          style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Inder"),
        ));
  }
}

//Ejemplo para ver si funciona una card por chaza
List<List<String>> chazas = [
  [
    "Sex-Chaza",
    "Frente a humanas",
    "3.5",
    "12000",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"
  ],
  [
    "Los perros del calvo HP",
    "Junto al FEM",
    "5.0",
    "8000",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-3.jpg"
  ],
  [
    "Calcas a 800",
    "La playita",
    "4.4",
    "5000",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"
  ]
];
