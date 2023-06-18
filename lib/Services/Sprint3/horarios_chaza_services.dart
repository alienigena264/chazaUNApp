import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> getHorario(String idHorario) async {
  var horario = (await FirebaseFirestore.instance
          .collection('Horario')
          .doc(idHorario)
          .get())
      .get('Dias') as Map<String, dynamic>;
  return horario;
}
