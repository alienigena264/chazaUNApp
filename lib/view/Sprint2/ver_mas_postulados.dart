
import 'package:chazaunapp/Models/menu_inicial_model.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:chazaunapp/Services/services_mehu_personalcandiadtos_chazero.dart';
import 'package:chazaunapp/view/Sprint2/personal_vista.dart';





class ver_mas_postulados extends StatelessWidget {
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
    //String chazaActual = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal'),
        shadowColor: colorPrincipal
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
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
              color: colorFondoField,
            ),
            Row(
                  children: [
                    Text(
                      'Nombres:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 100.0),
                    Expanded(
                      child: Text('Juan Alberto')
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
            Row(
                  children: [
                    Text(
                      'Apellidos:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 100.0),
                    Expanded(
                      child: Text('Aguilera Valadez')
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
            Row(
                  children: [
                    Text(
                      'Telefono:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 100.0),
                    Expanded(
                      child: Text('3224615885')
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
            
            SizedBox(height: 20.0),
            
            //Text(chazaActual),
            /*
            Text('Juan Alberto'),
            SizedBox(height: 10.0),
            Text('Apellidos'),
            Text('Aguilera Valadez'),
            SizedBox(height: 10.0),
            Text('Telefono'),
            Text('3224615885'),
            */
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
              color: colorFondoField,
            ),
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