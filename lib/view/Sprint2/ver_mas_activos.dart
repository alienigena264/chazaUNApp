import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chazaunapp/Services/Sprint2/ver_mas_activos_services.dart';
import 'personal_vista.dart';

const String _title = 'Personal';
const String id = 'FBDa7KnxssWwF2z7vTSh2nFSre12';

class VerMasActivos extends StatefulWidget {
  const VerMasActivos({super.key});

  @override
  State<VerMasActivos> createState() => _VerMasActivosState();
}

class _VerMasActivosState extends State<VerMasActivos> {
  int click = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal",
          style: TextStyle(
              color: Colors.white, // Establece el color del texto
              fontSize: 30.0, // Establece el tamaño del texto
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
        backgroundColor: colorPrincipal,
        leading: Container(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    click += 1;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                color: colorBackground)),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              avatar(),
              const SizedBox(
                height: 25,
              ),
              nombre(),
              const SizedBox(
                height: 5,
              ),
              apellido(),
              const SizedBox(
                height: 5,
              ),
              telefono(),
              const SizedBox(
                height: 5,
              ),
              correo(),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text(
                  'Horario',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildDiasSemana(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonalVista()), // Navega a PersonalVista
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(colorChazero),
                      ),
                      child: Text('Volver'),
                    ),
                  ),
                  const SizedBox(
                      width:
                          16), // Agrega un espacio horizontal entre los botones
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      // Lógica del botón "Despedir"
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text('Despedir'),
                  )),
                ],
              ),
            ])),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Inicio'), //Icono home
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Perfil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Ajustes')
        ],
        backgroundColor: Colors.white,
        selectedItemColor: colorPrincipal,
        unselectedItemColor: const Color(0xff909090),
        unselectedLabelStyle: const TextStyle(fontFamily: "Inder"),
        selectedLabelStyle: const TextStyle(fontFamily: "Inder"),
        iconSize: 34,
      ),
    );
  }
}

Widget avatar() {
  return Container(
    width: 150,
    height: 150,
    child: const CircleAvatar(
        backgroundImage: AssetImage('assets/imagenes/chef.png')),
  );
}

Widget nombre() {
  return FutureBuilder<String>(
    future:
        getNombreFromFirestore(id), // Reemplaza 'ID_DEL_USUARIO' con el ID real
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Muestra un indicador de carga mientras se obtiene el nombre desde Firebase
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // Muestra un mensaje de error si ocurre un error al obtener el nombre
        return Text('Error al obtener el nombre');
      } else {
        // Muestra el nombre obtenido desde Firebase
        return Text(
          snapshot.data ?? 'Nombre no encontrado',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal,
          ),
        );
      }
    },
  );
}

Widget apellido() {
  return FutureBuilder<String>(
    future: getApellidosFromFirestore(
        id), // Reemplaza 'ID_DEL_USUARIO' con el ID real
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Muestra un indicador de carga mientras se obtienen los apellidos desde Firebase
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // Muestra un mensaje de error si ocurre un error al obtener los apellidos
        print(
            'Error al obtener los apellidos desde Firebase: ${snapshot.error}');
        return Text('Error al obtener los apellidos');
      } else {
        // Muestra los apellidos obtenidos desde Firebase
        final apellidos = snapshot.data ?? 'Apellidos no encontrados';
        print('Apellidos recibidos desde Firebase: $apellidos');
        return Text(
          apellidos,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal,
          ),
        );
      }
    },
  );
}

Widget telefono() {
  return FutureBuilder<String>(
    future: getTelefonoFromFirestore(
        id), // Reemplaza 'ID_DEL_USUARIO' con el ID real
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Muestra un indicador de carga mientras se obtiene el teléfono desde Firebase
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // Muestra un mensaje de error si ocurre un error al obtener el teléfono
        print('Error al obtener el teléfono desde Firebase: ${snapshot.error}');
        return Text('Error al obtener el teléfono');
      } else {
        // Muestra el teléfono obtenido desde Firebase
        final telefono = snapshot.data ?? 'Teléfono no encontrado';
        print('Teléfono recibido desde Firebase: $telefono');
        return Text(
          telefono,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal,
          ),
        );
      }
    },
  );
}

Widget correo() {
  return FutureBuilder<String>(
    future:
        getCorreoFromFirestore(id), // Reemplaza 'ID_DEL_USUARIO' con el ID real
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Muestra un indicador de carga mientras se obtiene el teléfono desde Firebase
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // Muestra un mensaje de error si ocurre un error al obtener el teléfono
        print('Error al obtener el teléfono desde Firebase: ${snapshot.error}');
        return Text('Error al obtener el teléfono');
      } else {
        // Muestra el teléfono obtenido desde Firebase
        final telefono = snapshot.data ?? 'Teléfono no encontrado';
        print('Teléfono recibido desde Firebase: $telefono');
        return Text(
          telefono,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal,
          ),
        );
      }
    },
  );
}

Map<String, String> palabrasRelacionadas = {
  'Lunes': '09:00-10:30,   16:00-18:00',
  'Martes': '09:00-10:30',
  'Miércoles': '09:00-10:30,   16:00-18:00',
  'Jueves': 'No Disponible',
  'Viernes': '09:00-10:30,   16:00-18:00',
  'Sábado': '09:00-10:30,   16:00-18:00',
};
Column buildDiasSemana() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildDia('Lunes'),
      SizedBox(
          height: 16), // Agrega espacio vertical entre los días de la semana
      buildDia('Martes'),
      SizedBox(height: 16),
      buildDia('Miércoles'),
      SizedBox(height: 16),
      buildDia('Jueves'),
      SizedBox(height: 16),
      buildDia('Viernes'),
      SizedBox(height: 16),
      buildDia('Sábado'),
    ],
  );
}

Widget buildDia(String nombreDia) {
  String palabras = palabrasRelacionadas[nombreDia] ?? '';

  return Container(
    margin: EdgeInsets.only(
        bottom: 8), // Agrega espacio inferior entre cada día de la semana
    child: Row(
      children: [
        Text(
          '$nombreDia:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
            width:
                16), // Agrega espacio horizontal entre el día de la semana y las palabras relacionadas
        Expanded(
          child: Text(
            palabras,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
