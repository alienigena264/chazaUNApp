import 'package:chazaunapp/Services/Sprint2/ver_mas_postulados_services.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class VerMasPostulados extends StatelessWidget {
  final String uid;
  const VerMasPostulados(this.uid, {super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height * 0.25;
    
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight),
            child: AppBar(
              title: const Text("Personal"),
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 60.0),
              toolbarHeight: screenHeight,
              scrolledUnderElevation: 2000,
              centerTitle: true,
              backgroundColor: colorPrincipal,
            )),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
                future: getinfo(uid),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return (Column(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                  backgroundColor: colorFondoField,
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(snapshot.data?['foto'])),
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
                                const Text(
                                  'Nombres:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 100.0),
                                Expanded(
                                    child: Text(snapshot.data?['nombres'])),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Apellidos:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 100.0),
                                Expanded(
                                    child: Text(snapshot.data?['apellidos'])),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Teléfono:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 105.0),
                                Expanded(
                                    child: Text(snapshot.data?['telefono'])),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            const Divider(
                              height: 20,
                              thickness: 5,
                              indent: 20,
                              endIndent: 0,
                              color: colorFondoField,
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Horarios disponibles:',
                              style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Lunes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 105.0),
                                Expanded(child: Text(snapshot.data?['correo'])),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Martes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 100.0),
                                Expanded(child: Text(snapshot.data?['correo'])),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Miercoles',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 80.0),
                                Expanded(child: Text(snapshot.data?['correo'])),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Jueves',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 100.0),
                                Expanded(child: Text(snapshot.data?['correo'])),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Viernes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 100.0),
                                Expanded(child: Text(snapshot.data?['correo'])),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Sábado',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 100.0),
                                Expanded(child: Text(snapshot.data?['correo'])),
                              ],
                            ),
                            const SizedBox(height: 50.0),
                          ])
                    ]));
                  } else {
                    return const Text('Papi, ya se lo tiró');
                  }
                }))));
  }
}

/*
import 'package:chazaunapp/Services/Sprint2/ver_mas_postulados_services.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class VerMasPostulados extends StatelessWidget {
  final String uid;
  const VerMasPostulados(this.uid, {super.key});
  
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height * 0.25;
    
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight),
          child: AppBar(
            title: const Text(
              "Personal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
              ),
            ),
            centerTitle: true,
            toolbarHeight: screenHeight, // Ajusta la altura deseada
            scrolledUnderElevation: 2000,
            backgroundColor: colorPrincipal,
          ),
        ),
        
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: getinfo(uid),
            builder: ((context, snapshot){
              if (snapshot.hasData){
                return (Column (children:{
                  Column(

                 /* )
                }
              }
            }
            )*/
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: colorFondoField,
                  radius: 50,
                  backgroundImage: NetworkImage(snapshot.data != null?(['foto'])),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,o
                endIndent: 0,
                color: colorFondoField,
              ),
              /*FutureBuilder(
                  future: getinfo(uid),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      String a = snapshot.data!['apellidos'];
                      return Text('$a funciona');
                    } else {
                      return const Text('ola q ase');
                    }
                  })),
                  */
              const Row(
                children: [
                  
                  Text(
                    'Nombres:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(width: 100.0),
                  
                  Expanded(child: Text('aiuda')),
                ],
                
              ),
              const SizedBox(height: 16.0),
              const Row(
                children: [
                  Text(
                    'Apellidos:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 100.0),
                  Expanded(child: Text('Aguilera Valadez')),
                ],
              ),
              const SizedBox(height: 16.0),
              const Row(
                children: [
                  Text(
                    'Telefono:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 100.0),
                  Expanded(child: Text('3224615885')),
                ],
              ),
              const SizedBox(height: 16.0),

              const SizedBox(height: 20.0),

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
              const SizedBox(height: 20.0),
              const Text('Horarios disponibles:'),
              const SizedBox(height: 10.0),
              const Text('Lunes'),
              const Text('09:00-10:30, 16:00-18:00'),
              const SizedBox(height: 10.0),
              const Text('Martes'),
              const Text('09:00-10:30'),
              const SizedBox(height: 10.0),
              const Text('Miércoles'),
              const Text('09:00-10:30, 16:00-18:00'),
              const SizedBox(height: 10.0),
              const Text('Jueves'),
              const Text('No Disponible'),
              const SizedBox(height: 10.0),
              const Text('Viernes'),
              const Text('09:00-10:30, 16:00-18:00'),
              const SizedBox(height: 10.0),
              const Text('Sábado'),
              const Text('09:00-10:30, 16:00-18:00'),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      //color: Colors.green,
                      child: const Text('Contratar')),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      //color: Colors.red,
                      child: const Text('Rechazar')),
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

};
*/