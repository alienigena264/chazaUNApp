import 'package:chazaunapp/Services/Sprint2/ver_mas_postulados_services.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class VerMasPostulados extends StatelessWidget {
  final String uid;
  final String cid; //chaza id
  const VerMasPostulados(this.uid, this.cid, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: const Text(
            "Personal",
            style: TextStyle(
                color: Colors.white, // Establece el color del texto
                fontSize: 30.0, // Establece el tamaño del texto
                fontFamily: "Inder",
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: colorPrincipal,
        )),
        body: FutureBuilder(
            future: getinfo(uid, cid),
            builder: ((context, snapshot) {
              goMenu(String texto) {
                mostrarMensaje(context, texto);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/menu/chazero/personal', ModalRoute.withName('/'),
                    arguments: cid);
              }

              if (snapshot.hasData) {
                return (SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Center(
                            child: CircleAvatar(
                                backgroundColor: colorFondoField,
                                radius: 75,
                                backgroundImage:
                                    NetworkImage(snapshot.data?['foto'])),
                          ),
                          const Spacer(),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 20,
                            endIndent: 0,
                            color: colorFondoField,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              children: [
                                const Text(
                                  ' Teléfono:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 103.0),
                                Expanded(
                                    child: Text(snapshot.data?['telefono'])),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 20,
                            endIndent: 0,
                            color: colorFondoField,
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Horarios disponibles:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  'Lunes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 107.0),
                              Expanded(
                                  child:
                                      Text(snapshot.data!['Lunes'].toString())),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  'Martes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 100.0),
                              Expanded(
                                  child: Text(
                                      snapshot.data!['Martes'].toString())),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  'Miercoles',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 82.0),
                              Expanded(
                                  child: Text(
                                      snapshot.data!['Miercoles'].toString())),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  'Jueves',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 101.0),
                              Expanded(
                                  child: Text(
                                      snapshot.data!['Jueves'].toString())),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  'Viernes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 98.0),
                              Expanded(
                                  child: Text(
                                      snapshot.data!['Viernes'].toString())),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  'Sábado',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 98.0),
                              Expanded(
                                  child: Text(
                                      snapshot.data!['Sabado'].toString())),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  await contratar(uid, cid);
                                  // Lógica cuando se presiona el botón "Contratar"
                                  String nombre = snapshot.data?['nombres'];
                                  String mensajeboton =
                                      ' ha sido contratad@, Talvez debas reiniciar la chaza para ver los cambios';
                                  String textorechazado = nombre + mensajeboton;
                                  goMenu(textorechazado);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: const Text('Contratar'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  // Lógica cuando se presiona el botón "Rechazar"
                                  await rechazar(uid, cid, eliminar: false);
                                  String nombre = snapshot.data?['nombres'];
                                  String mensajeboton = ' ha sido rechazad@';
                                  String textoaceptado = nombre + mensajeboton;
                                  goMenu(textoaceptado);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text('Rechazar'),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ])));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }

  void mostrarMensaje(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
