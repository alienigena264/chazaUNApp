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
              const SizedBox(height: 25,),
              SizedBox(
                height: 570,
                width: 335,// Tamaño fijo
                child: ListView.builder( //Hace una lista de todas las filas que había en la matriz chazas
                  shrinkWrap: true,
                  itemExtent: 198,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: chazas.length, // casi como un for que itera las veces de las filas de la matriz
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [SizedBox(height: 183,
                      child: infoChaza_( // hace una card infochaza con los detalles de cada fila, osea cada chaza
                          chazas[index][0], chazas[index][1], chazas[index][2],
                          chazas[index][3], chazas[index][4]),),
                      const SizedBox(height: 15,)], //Espacio entre las cards
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
      height: 150.0,
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
                fontSize: 60.0, // Establece el tamaño del texto
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
                    style: const TextStyle(
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
          ), const Divider(
            color: Colors.black54,
            indent: 15,
            endIndent: 15,
            thickness: 1.5, // ajusta el grosor de la línea
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

  Row rowPuntuacion_(String puntuacion) { //row para juntar el icono y el texto
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
        child: Row(
          children: const [
            Text(
              "Horarios",
              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Inder"),
            ),
            SizedBox(width: 15,),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16.0,)
          ],
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
        child: Row(
          children: const [
            Text(
              "Personal",
              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Inder"),
            ),
            SizedBox(width: 15,),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16.0,)
          ],
        ));
  }
  BottomNavigationBar barraChazero(){ //La barra de opciones inferior
    return BottomNavigationBar(items:const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label:'Inicio'),//Icono home
    BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Perfil'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Ajustes')
    ], backgroundColor: Colors.white, selectedItemColor: colorPrincipal,
    unselectedItemColor: const Color(0xff909090), unselectedLabelStyle: const TextStyle(fontFamily: "Inder"),
    selectedLabelStyle: const TextStyle(fontFamily: "Inder"), iconSize: 34,//Detalles del color del item seleccionado y la fuente de lo labels
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
  [
    "Calcas a 800",
    "La playita",
    "5.0",
    "5800",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-3.jpg"
  ],
  [
    "Buho-Chaza",
    "Entrada de la 26",
    "3.9",
    "2500",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"
  ]
];
