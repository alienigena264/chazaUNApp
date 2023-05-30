
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal',
      color: colorPrincipal,
      
      home: ProfilePage(),
      


    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: colorFondoField,
                radius: 50,
                backgroundImage: AssetImage('assets/imagenes/chef2.png'),
              ),
            ),
            SizedBox(height: 20.0),
            Text('Primer Nombre'),
            Text('Juan'),
            SizedBox(height: 10.0),
            Text('Segundo Nombre'),
            Text('Alberto'),
            SizedBox(height: 10.0),
            Text('Primer Apellido'),
            Text('Aguilera'),
            SizedBox(height: 10.0),
            Text('Segundo Apellido'),
            Text('Valadez'),
            SizedBox(height: 20.0),
            Text('Horarios disponibles:'),
            SizedBox(height: 10.0),
            Text('Lunes'),
            Text('09:00-10:30, 16:00-18:00'),
            SizedBox(height: 10.0),
            Text('Martes'),
            Text('09:00-10:30'),
            SizedBox(height: 10.0),
            Text('Miércoles'),
            Text('09:00-10:30, 16:00-18:00'),
            SizedBox(height: 10.0),
            Text('Jueves'),
            Text('No Disponible'),
            SizedBox(height: 10.0),
            Text('Viernes'),
            Text('09:00-10:30, 16:00-18:00'),
            SizedBox(height: 10.0),
            Text('Sábado'),
            Text('09:00-10:30, 16:00-18:00'),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  //color: Colors.green,
                  child: Text('Contratar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor : Colors.green,
                    )
                ),
                ElevatedButton(
                  onPressed: () {},
                  //color: Colors.red,
                  child: Text('Rechazar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor : Colors.red,
                    )
                ),
              ],
            ),
          ],
      
        ),
      
      )
    
    );

  }
  BottomNavigationBar barraChazero(BuildContext context) {
    //La barra de opciones inferior
    return BottomNavigationBar(
      //currentIndex: _currentIndex,
      //onTap: _onItemTapped,
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
      unselectedItemColor: const Color(0xff909090),
      unselectedLabelStyle: const TextStyle(fontFamily: "Inder"),
      selectedLabelStyle: const TextStyle(fontFamily: "Inder"),
      iconSize:
      34, //Detalles del color del item seleccionado y la fuente de los labels
    );
  }
}