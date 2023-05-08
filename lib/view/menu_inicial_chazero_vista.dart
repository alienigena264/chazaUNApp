import 'package:flutter/material.dart';
import 'package:chazaunapp/view/colors.dart';
//Pruebita pull request

class MenuChazero extends StatefulWidget {
  const MenuChazero({super.key});

  @override
  State<MenuChazero> createState() => _MenuChazeroState();
}

class _MenuChazeroState extends State<MenuChazero> {
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
                height: 435, // Tamaño fijo
                child: ListView.builder( //Hace una lista de todas las filas que había en la matriz chazas
                  shrinkWrap: true,
                  itemCount: chazas.length, // casi como un for que itera las veces de las filas de la matriz
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 162,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: infoChaza_( // hace una card infochaza con los detalles de cada fila, osea cada chaza
                          chazas[index][0], chazas[index][1], chazas[index][2],
                          chazas[index][3], chazas[index][4]),
                    );
                  },
                ),
              ),
              Stack(children: [barraChazero()],)],
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
        )
    );
  }

  Card infoChaza_(String nombre, String ubicacion, String puntuacion,
      String pago, String imagen) {
    return Card( //Una columna que contiene rows y columnas de rows para conseguir el aspecto que habia en el mockup
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
                    style: TextStyle(
                        color: Color(0xff242424),
                        fontSize: 20.0,
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

  Row rowUbicacion_(String ubicacion) { //row para juntar el icono y el texto
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.location_on_rounded, color: Color(0xff919191), size: 15.0),
        Text(
          ubicacion,
          style: TextStyle(
              color: Color(0xff919191),
              fontSize: 14.5,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Row rowPuntuacion_(String puntuacion) { //row para juntar el icono y el texto
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.star,
          color: colorChazero,
          size: 15.0,
        ),
        Text(
          puntuacion,
          style: TextStyle(
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
        ClipRRect( // Contenedor para que la imagen tenga borde redondeado
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: NetworkImage(imagen), //Parametro del enlace de la imagen de la chaza
            height: 61.0, // Tamaño
          ),
        ),
        Text(
          pago + " / Hora",
          style: TextStyle(
              color: colorTrabajador,
              fontSize: 13.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
        Icon(
          Icons.more_horiz,
          color: Color(0xffEFB810ff919191),
          size: 24.0,
        ),
      ],
    );
  }
  ElevatedButton botonHorarios(){ //Au no hace nada porque no tengo seguridad de si esa pantalla está disponible
    return ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor:colorChazero,
      minimumSize: const Size(
          130, 34), // double.infinity is the width and 30 is the height
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
  ElevatedButton botonPersonal(){ //Aun no hace nada porque no tengo seguridad de cual es esa pantalla y si está disponible
    return ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor: colorChazero,
      minimumSize: const Size(
          130, 34),
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
  BottomNavigationBar barraChazero(){ //La barra de opciones inferior
    return BottomNavigationBar(items:[
      BottomNavigationBarItem(icon: Icon(Icons.home), label:'Inicio'),//Icono home
    BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Perfil'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Ajustes')
    ], backgroundColor: Colors.white, selectedItemColor: colorPrincipal,
    unselectedItemColor: Color(0xff909090), unselectedLabelStyle: TextStyle(fontFamily: "Inder"),
    selectedLabelStyle: TextStyle(fontFamily: "Inder"), iconSize: 34,//Detalles del color del item seleccionado y la fuente de lo labels
    );
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
];
