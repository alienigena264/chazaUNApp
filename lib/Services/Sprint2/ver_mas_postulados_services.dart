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

despedir(uid,cid) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference coleccionRelacion = db.collection('Postulaciones');
  CollectionReference coleccionHorario = db.collection('Horario');

  var idHorario; 
  
      await coleccionRelacion
      .where('IDTrabajador', isEqualTo: uid)
      .where('IDChaza', isEqualTo: cid)
      .get().then((value)=>{
        idHorario=
        (value.docs.first.data() as Map<String, dynamic>)['IDHorario'],
        coleccionRelacion.doc(value.docs.first.id).delete()
        
      });
      var horario=coleccionHorario.doc(idHorario).get();
  coleccionHorario.doc(idHorario).delete();
  return horario;
}
