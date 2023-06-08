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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(175),
            child: AppBar(
              title: const Text("Personal"),
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 60.0),
              toolbarHeight: 175,
              scrolledUnderElevation: 2000,
              centerTitle: true,
              backgroundColor: colorPrincipal,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                padding: const EdgeInsets.only(bottom: 60),
                icon: const Icon(Icons.arrow_back),
                iconSize: 40,
              ),
            )),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
                future: getinfo(uid, cid),
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
                                const SizedBox(width: 103.0),
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
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              children: [
                                const Text(
                                  'Lunes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 107.0),
                                Expanded(
                                    child: Text(
                                        snapshot.data!['Lunes'].toString())),
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
                                Expanded(
                                    child: Text(
                                        snapshot.data!['Martes'].toString())),
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
                                const SizedBox(width: 82.0),
                                Expanded(
                                    child: Text(snapshot.data!['Miercoles']
                                        .toString())),
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
                                const SizedBox(width: 101.0),
                                Expanded(
                                    child: Text(
                                        snapshot.data!['Jueves'].toString())),
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
                                const SizedBox(width: 98.0),
                                Expanded(
                                    child: Text(
                                        snapshot.data!['Viernes'].toString())),
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
                                const SizedBox(width: 98.0),
                                Expanded(
                                    child: Text(
                                        snapshot.data!['Sabado'].toString())),
                              ],
                            ),
                            const SizedBox(height: 50.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Lógica cuando se presiona el botón "Contratar"
                                    String nombre = snapshot.data?['nombres'];
                                    String mensajeboton = ' ha sido contratad@';
                                    String textorechazado =
                                        nombre + mensajeboton;
                                    mostrarMensaje(context, textorechazado);
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text('Contratar'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Lógica cuando se presiona el botón "Rechazar"
                                    String nombre = snapshot.data?['nombres'];
                                    String mensajeboton = ' ha sido rechazad@';
                                    String textoaceptado =
                                        nombre + mensajeboton;
                                    mostrarMensaje(context, textoaceptado);
                                    Navigator.of(context).pop();
                                    rechazar(uid, cid);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text('Rechazar'),
                                ),
                              ],
                            ),
                          ])
                    ]));
                  } else {
                    return const Text('Papi, ya se lo tiró');
                  }
                }))));
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
