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
            coleccionPostulacion.doc(value.docs.first.id).delete()
          });
  var horario = await coleccionHorario.doc(idHorario).get();
  coleccionHorario.doc(idHorario).delete();
  return horario.data() as Map<String, dynamic>;
}

contratar(uid, cid) async {
  //borra de postulados
  Map<String, dynamic> horario = await rechazar(uid, cid);
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccionRelacion = db.collection('RelacionTrabajador');
  CollectionReference coleccionHorario = db.collection('Horario');
  CollectionReference coleccionChazas = db.collection('Chaza');

  var snapshotChaza = await coleccionChazas.doc(cid).get();
  String idHorario = snapshotChaza.get('horario');
  final data = {"IDTrabajador": uid, "IDChaza": cid};
  coleccionRelacion.add(data);
  //guarda en relacion trabajador

  var horarioChaza = (await coleccionHorario.doc(idHorario).get()).get('Dias')
      as Map<String, dynamic>;
  horario = horario['Dias'];
  Map<String, dynamic> dias = {};
  for (var key in horarioChaza.keys) {
    print('key $key');
    var map = horarioChaza[key] as Map<String, dynamic>;
    print(map);
    var temp = horario[key];
    for (var i in temp) {
      print(i);
      //actualiza cada día
      map.update(
          i,
          (value) => {
                //que no haya nadie en esa posición
                if (value == "") {uid} else {uid} //por ahora reemplaza
              },
          ifAbsent: () => {});
    }
    //almacena cada día
    dias.addAll({key: map});
  }
  //manda a la bd
  coleccionHorario.doc(idHorario).set({'Dias': horarioChaza});
}
