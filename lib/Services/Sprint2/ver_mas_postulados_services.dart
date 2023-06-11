import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> getinfo(uid, cid) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccionTrabajador = db.collection('Trabajador');
  CollectionReference coleccionRelacion = db.collection('Postulaciones');
  CollectionReference coleccionHorario = db.collection('Horario');
  //Para encontrar el horario
  DocumentSnapshot trabajadorSnapshot =
      await coleccionTrabajador.doc(uid).get();
  var horarioID = await coleccionRelacion
      .where('IDTrabajador', isEqualTo: uid)
      .where('IDChaza', isEqualTo: cid)
      .get();
  var idHorario =
      (horarioID.docs.first.data() as Map<String, dynamic>)['IDHorario'];
  DocumentSnapshot horarioSnapshot =
      await coleccionHorario.doc(idHorario).get();
  var datosHorario = horarioSnapshot.data() as Map<String, dynamic>;
  //guarda directamente los dias y las horas,
  //LAS HORAS SON UNA LISTA DINAMICA
  datosHorario = datosHorario['Dias'] as Map<String, dynamic>;
  var datosTrabajador = trabajadorSnapshot.data() as Map<String, dynamic>;
  //los añade a los datos del trabajador con los demas datos
  datosTrabajador.addAll(datosHorario);
  return datosTrabajador;
}

rechazar(uid, cid) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccionPostulacion = db.collection('Postulaciones');
  CollectionReference coleccionHorario = db.collection('Horario');

  // ignore: prefer_typing_uninitialized_variables
  var idHorario;

  await coleccionPostulacion
      .where('IDTrabajador', isEqualTo: uid)
      .where('IDChaza', isEqualTo: cid)
      .get()
      .then((value) => {
            idHorario =
                (value.docs.first.data() as Map<String, dynamic>)['IDHorario'],
            //coleccionPostulacion.doc(value.docs.first.id).delete()
          });
  var horario = coleccionHorario.doc(idHorario).get();
  //coleccionHorario.doc(idHorario).delete();
  return horario;
}

contratar(uid, cid) async {
  var horario = await rechazar(uid, cid) as Map<String, dynamic>;
  print(horario);
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccionRelacion = db.collection('RelacionTrabajadores');
  CollectionReference coleccionHorario = db.collection('Horario');
  CollectionReference coleccionChazas = db.collection('Chazas');

  var chaza = coleccionChazas.doc(cid).get() as Map<String, dynamic>;
  final data = {"IDTrabajador": uid, "IDChaza": cid};
  coleccionRelacion.add(data);

  Map<String, Map<String, String>> horarioChaza =
      (coleccionHorario.doc(chaza["horario"] as String).get()
          as Map<String, dynamic>)['Dias'] as Map<String, Map<String, String>>;
  horario = horario['Dias'] as Map<String, Array>;
  print(horario);
  print(horarioChaza);
  for (var key in horarioChaza.keys) {
    var temp = horario[key];
    for (var i in temp) {
      horarioChaza[key]?.update(i, (value) => uid);
      print(horarioChaza[key]);
    }
  }
  coleccionHorario.doc(chaza['horario'] as String).set({'Dias': horarioChaza});
}
