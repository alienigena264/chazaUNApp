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

rechazar(uid, cid, {bool eliminar = true}) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccionPostulacion = db.collection('Postulaciones');
  CollectionReference coleccionHorario = db.collection('Horario');

  String idHorario = "";

  await coleccionPostulacion
      .where('IDTrabajador', isEqualTo: uid)
      .where('IDChaza', isEqualTo: cid)
      .get()
      .then((value) => {
            idHorario =
                (value.docs.first.data() as Map<String, dynamic>)['IDHorario'],
            coleccionPostulacion.doc(value.docs.first.id).delete()
          });
  if (eliminar) {
    await coleccionHorario.doc(idHorario).delete();
  }
  return idHorario;
}

contratar(uid, cid) async {
  //borra de postulados
  String idHorarioTrabajador = await rechazar(uid, cid, eliminar: false);
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccionRelacion = db.collection('RelacionTrabajadores');
  CollectionReference coleccionHorario = db.collection('Horario');
  CollectionReference coleccionChazas = db.collection('Chaza');

  var horario = (await coleccionHorario.doc(idHorarioTrabajador).get())
      .get('Dias') as Map<String, dynamic>;
  var snapshotChaza = await coleccionChazas.doc(cid).get();
  String idHorario = snapshotChaza.get('horario');
  //guarda en relacion trabajador

  var horarioChaza = (await coleccionHorario.doc(idHorario).get()).get('Dias')
      as Map<String, dynamic>;
  Map<String, dynamic> dias = {};
  for (var key in horarioChaza.keys) {
    var map = horarioChaza[key] as Map<String, dynamic>;
    var temp = horario[key];
    for (var i in temp) {
      //actualiza cada día
      if (i == '') {
        continue;
      }
      map.update(
        i,
        (value) => uid,
      );
    }
    //almacena cada día
    dias.addAll({key: map});
    print(key);
    print(map);
  }
  //manda a la bd
  await coleccionHorario.doc(idHorario).set({'Dias': dias});
  final data = {
    "IDTrabajador": uid,
    "IDChaza": cid,
    "IDHorario": idHorarioTrabajador
  };
  return await coleccionRelacion.add(data);
}
