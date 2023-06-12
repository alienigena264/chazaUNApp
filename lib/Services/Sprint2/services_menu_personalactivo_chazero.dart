import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference collectionReferenceTrabajador = db.collection("Trabajador");

// copia exacta del menu de candidatos lol
Future<List> getPersonalActivoPorChaza(String idChaza) async {
  var idHorario = await db.collection("Chaza").doc(idChaza).get().then((value) {
    return value.data()?["horario"];
  });

  List lista = [];

  final horarioRef = await db.collection("Horario").
  doc(idHorario).get().then((value) => value.get("Dias"));

  Map<String, dynamic> datos = horarioRef as Map<String, dynamic>;
  Map<dynamic, dynamic> prueba = {};

  prueba = Map.fromIterable(datos.values);

  print (prueba.keys);

  return lista;
}

List<bool> trabajaDiasActivo(List todos) {
  List<bool> trabaja = [];
  trabaja.add(todos[1]['Dias']['Lunes'][0] != "");
  trabaja.add(todos[1]['Dias']['Martes'][0] != "");
  trabaja.add(todos[1]['Dias']['Miercoles'][0] != "");
  trabaja.add(todos[1]['Dias']['Jueves'][0] != "");
  trabaja.add(todos[1]['Dias']['Viernes'][0] != "");
  trabaja.add(todos[1]['Dias']['Sabado'][0] != "");
  return trabaja;
}
