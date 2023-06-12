// ignore_for_file: avoid_print

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
      print('Nombre no encontrado en Firebase');
    }
  } else {
    print('Documento no encontrado en Firebase');
  }
  return ''; // Valor predeterminado si no se encuentra el nombre en Firebase
}

Future<String> getApellidosFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['apellidos'] != null) {
      return data['apellidos'];
    } else {
      print('Apellidos no encontrados en Firebase');
    }
  } else {
    print('Documento no encontrado en Firebase');
  }
  return ''; // Valor predeterminado si no se encuentran los apellidos en Firebase
}

Future<String> getTelefonoFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['telefono'] != null) {
      return data['telefono'];
    } else {
      print('Teléfono no encontrado en Firebase');
    }
  } else {
    print('Documento no encontrado en Firebase');
  }
  return ''; // Valor predeterminado si no se encuentra el teléfono en Firebase
}

Future<String?> getFotoUrlFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['foto'] != null) {
      return data['foto'];
    } else {
      print('URL de foto no encontrada en Firebase');
    }
  } else {
    print('Documento no encontrado en Firebase');
  }
  return null; // Valor predeterminado si no se encuentra la URL de foto en Firebase
}

Future<List<List<String>>> fetchIDHorario(String idTrabajador) async {
  try {
    QuerySnapshot querySnapshot = await db
        .collection('RelacionTrabajadores')
        .where('IDTrabajador', isEqualTo: idTrabajador)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Se encontró al menos un documento con el IDTrabajador especificado
      String idHorario = querySnapshot.docs[0]['IDHorario'];
      // Acceder a la colección "Horario" utilizando el IDHorario obtenido
      return fetchHoras(idHorario);
    } else {
      // No se encontró ningún documento con el IDTrabajador especificado
      print(
          'No se encontró el IDTrabajador en la colección "RelacionTrabajadores"');
      return [];
    }
  } catch (error) {
    print('Error al obtener los documentos de RelacionTrabajadores: $error');
    return [];
  }
}

Future<List<List<String>>> fetchHoras(String idHorario) async {
  Map<String, List<String>> horasMap = {};

  try {
    var documentSnapshot = await db.collection('Horario').doc(idHorario).get();

    if (documentSnapshot.exists) {
      var data = documentSnapshot.data();

      var dias = data!['Dias'];
      dias.forEach((dia, horas) {
        horasMap[dia] = List<String>.from(horas);
      });
      print(dias);
    } else {
      throw Exception('El ID de Horario no existe');
    }
  } catch (error) {
    throw Exception('Error al obtener el Horario: $error');
  }

  List<List<String>> horasSemana = horasMap.values.toList();
  print(horasSemana);
  return horasSemana;
}

Future<String> fetchIDHorarioEliminar(String idTrabajador) async {
  try {
    QuerySnapshot querySnapshot = await db
        .collection('RelacionTrabajadores')
        .where('IDTrabajador', isEqualTo: idTrabajador)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Se encontró al menos un documento con el IDTrabajador especificado
      String idHorario = querySnapshot.docs[0]['IDHorario'];
      return idHorario;
    } else {
      // No se encontró ningún documento con el IDTrabajador especificado
      print(
          'No se encontró el IDTrabajador en la colección "RelacionTrabajadores"');
      return '';
    }
  } catch (error) {
    print('Error al obtener los documentos de RelacionTrabajadores: $error');
    return '';
  }
}

Future<void> eliminarDocumentoRelacionTrabajadores(String idTrabajador) async {
  try {
    QuerySnapshot querySnapshot = await db
        .collection('RelacionTrabajadores')
        .where('IDTrabajador', isEqualTo: idTrabajador)
        .get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    print('Documento(s) de RelacionTrabajadores eliminado(s) correctamente');
  } catch (error) {
    print('Error al eliminar el documento de RelacionTrabajadores: $error');
  }
}

Future<void> eliminarDocumentoHorario(String idHorario) async {
  try {
    await db.collection('Horario').doc(idHorario).delete();

    print('Documento de Horario eliminado correctamente');
  } catch (error) {
    print('Error al eliminar el documento de Horario: $error');
  }
}
