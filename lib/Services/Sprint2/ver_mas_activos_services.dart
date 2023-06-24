import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

// ...

Future<String> getNombreFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['nombres'] != null) {
      return data['nombres'];
    } else {
      throw Exception('Nombre no encontrado en Firebase');
    }
  } else {
    throw Exception('Documento no encontrado en Firebase');
  }
}

Future<String> getApellidosFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['apellidos'] != null) {
      return data['apellidos'];
    } else {
      throw Exception('Apellidos no encontrados en Firebase');
    }
  } else {
    throw Exception('Documento no encontrado en Firebase');
  }
}

Future<String> getTelefonoFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['telefono'] != null) {
      return data['telefono'];
    } else {
      throw Exception('Teléfono no encontrado en Firebase');
    }
  } else {
    throw Exception('Documento no encontrado en Firebase');
  }
}

Future<String?> getFotoUrlFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['foto'] != null) {
      return data['foto'];
    } else {
      throw Exception('URL de foto no encontrada en Firebase');
    }
  } else {
    throw Exception('Documento no encontrado en Firebase');
  }
}

Future<List<List<String>>> fetchHoras(String idHorario) async {
  Map<String, List<String>> horasMap = {};

  try {
    var documentSnapshot = await db.collection('Horario').doc(idHorario).get();

    if (documentSnapshot.exists) {
      var data = documentSnapshot.data();

      var dias = data!['Dias'];
      var orderedDias = [
        'Lunes',
        'Martes',
        'Miercoles',
        'Jueves',
        'Viernes',
        'Sabado'
      ];
      for (var dia in orderedDias) {
        horasMap[dia] = List<String>.from(dias[dia]);
      }
    } else {
      throw Exception('El ID de Horario no existe');
    }
  } catch (error) {
    throw Exception('Error al obtener el Horario: $error');
  }

  List<List<String>> horasSemana = horasMap.values.toList();
  return horasSemana;
}

Future<void> actualizarEstadoRelacionTrabajadores(
    String idTrabajador, String idChaza) async {
  try {
    QuerySnapshot querySnapshot = await db
        .collection('RelacionTrabajadores')
        .where('IDTrabajador', isEqualTo: idTrabajador)
        .where('IDChaza', isEqualTo: idChaza)
        .get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.update({'Estado': false});
    }
  } catch (error) {
    throw Exception(
        'Error al actualizar el estado en RelacionTrabajadores: $error');
  }
}

Future<void> actualizarMapaEnFirestore(
    String idDocumento, Map<String, dynamic> nuevoMapa) async {
  try {
    await FirebaseFirestore.instance
        .collection('Horario')
        .doc(idDocumento)
        .update({'Dias': nuevoMapa});
  } catch (error) {
    throw Exception('Error al actualizar en Firestore: $error');
  }
}

void reemplazarIdTrabajadorEnMapa(
    //elimina la coincidencia del trabajador en el horario
    Map<String, dynamic> mapa,
    String idTrabajador) {
  for (var dia in mapa.keys) {
    Map<String, dynamic> horarios = mapa[dia];
    for (var horario in horarios.keys.toList()) {
      if (horarios[horario] == idTrabajador) {
        horarios[horario] = "";
      }
    }
  }
}

Future<void> buscarHorarioPorIdTrabajador(
    String idTrabajador, String idChaza) async {
  // Buscar en la colección "RelacionTrabajadores" por el idTrabajador
  // String idHorarioTrabajador = relacionSnapshot.docs[0]['IDHorario'];

  // Buscar en la colección "Chaza" por el idChaza
  DocumentSnapshot chazaSnapshot =
      await db.collection('Chaza').doc(idChaza).get();

  // Verificar si se encontró el documento en la colección "Chaza"
  if (chazaSnapshot.exists) {
    // Obtener el ID del horario desde el campo "horario" del documento
    String idHorario = chazaSnapshot['horario'];

    // Buscar en la colección "Horario" por el idHorario
    DocumentSnapshot horarioSnapshot =
        await db.collection('Horario').doc(idHorario).get();

    // Verificar si se encontró el documento en la colección "Horario"
    if (horarioSnapshot.exists) {
      Map<String, dynamic> dias = horarioSnapshot['Dias'];
      reemplazarIdTrabajadorEnMapa(dias, idTrabajador);

      actualizarMapaEnFirestore(idHorario, dias);
    } else {
      throw Exception('El mapa "Dias" no contiene todos los días de la semana');
    }
  } else {
    throw Exception('El horario no existe');
  }
}
