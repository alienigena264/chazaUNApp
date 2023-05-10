import 'package:flutter/material.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:chazaunapp/Services/services_menuchazero.dart';

//Pruebita pull request

class MenuChazeroVista extends StatefulWidget {
  const MenuChazeroVista({super.key});

  @override
  State<MenuChazeroVista> createState() => _MenuChazeroVistaState();
}

class _MenuChazeroVistaState extends State<MenuChazeroVista> {
  int _currentIndex = 0;
  String idChazero = "D5KI1DaVGA8e9toA0lCq";
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
                height: 690,
                width: 410, // Tamaño fijo
                child: FutureBuilder(
                  future: getChazasporChazero(idChazero),
                  builder: ((context, snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        //Hace una lista de todas las filas que había en la matriz chazas
                        shrinkWrap: true,
                        itemExtent: 215,
                        padding: EdgeInsets.only(bottom: 20),
                        itemCount: snapshot.data?.length,  // casi como un for que itera las veces de las filas de la matriz
                        itemBuilder: (ontext, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: infoChaza_(
                                  // hace una card infochaza con los detalles de cada fila, osea cada chaza
                                    snapshot.data?[index]['nombre'],
                                    snapshot.data?[index]['ubicacion'],
                                    snapshot.data?[index]['puntuacion'],
                                    snapshot.data?[index]['paga'],
                                    snapshot.data?[index]['imagen']),
                              ),
                              SizedBox(
                                height: 15,
                              )], //Espacio entre las cards
                          );
                        },
                      );
                    } else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                ),
              ),
              Stack(
                children: [barraChazero(context)],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox barraSuperior_() {
    return SizedBox(
        height: 200.0,
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
                  fontSize: 50.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                ),
              ),
            ),
          ),
        ));
  }

  Card infoChaza_(String nombre, String ubicacion, String puntuacion,
      String pago, String imagen) {
    return Card(
      //Una columna que contiene rows y columnas de rows para conseguir el aspecto que habia en el mockup
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
          Divider(
            color: Colors.black45,
            thickness: 1.5, // ajusta el grosor de la línea
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [botonHorarios(context), botonPersonal(context)],
          )
        ],
      ),
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

  Column columnFotoYPagoChaza_(String imagen, String pago) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          // Contenedor para que la imagen tenga borde redondeado
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: NetworkImage(imagen),
            //Parametro del enlace de la imagen de la chaza
            height: 65.0,
            // Tamaño
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

  ElevatedButton botonHorarios(BuildContext context) {
    //Au no hace nada porque no tengo seguridad de si esa pantalla está disponible
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorChazero,
          minimumSize: const Size(
              132, 40), // double.infinity is the width and 30 is the height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        onPressed: irEnProgreso(context),
        child: const Text(
          "Horarios",
          style:
          TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Inder"),
        ));
  }

  ElevatedButton botonPersonal(BuildContext context) {
    //Aun no hace nada porque no tengo seguridad de cual es esa pantalla y si está disponible
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorChazero,
          minimumSize: const Size(132, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        onPressed: irEnProgreso(context),
        child: const Text(
          "Personal",
          style:
          TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Inder"),
        ));
  }

  BottomNavigationBar barraChazero(BuildContext context) {
    //La barra de opciones inferior
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        //Icono home
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded), label: 'Perfil'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), label: 'Ajustes')
      ],
      backgroundColor: Colors.white,
      selectedItemColor: colorPrincipal,
      unselectedItemColor: Color(0xff909090),
      unselectedLabelStyle: TextStyle(fontFamily: "Inder"),
      selectedLabelStyle: TextStyle(fontFamily: "Inder"),
      iconSize:
      34, //Detalles del color del item seleccionado y la fuente de lo labels
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    irEnProgreso(context);
  }

  Function() irEnProgreso(BuildContext context) {
    return () {
      Navigator.pushNamed(context, '/progreso');
    };
  }
}

//Ejemplo para ver si funciona una card por chaza
/*
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
*/