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
      print(data);

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
        if (dias.containsKey(dia)) {
          horasMap[dia] = List<String>.from(dias[dia]);
        } else {
          horasMap[dia] = [];
        }
      }
      print(orderedDias);
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

Future<void> actualizarEstadoRelacionTrabajadores(String idTrabajador) async {
  try {
    QuerySnapshot querySnapshot = await db
        .collection('RelacionTrabajadores')
        .where('IDTrabajador', isEqualTo: idTrabajador)
        .get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.update({'Estado': false});
    }

    print('Estado actualizado correctamente en RelacionTrabajadores');
  } catch (error) {
    print('Error al actualizar el estado en RelacionTrabajadores: $error');
  }
}

// Future<void> buscarHorarioPorIdTrabajador(String idTrabajador) async {
//   try {
//     // Buscar en la colección "RelacionTrabajadores" por el idTrabajador
//     QuerySnapshot relacionSnapshot = await db
//         .collection('RelacionTrabajadores')
//         .where('IDTrabajador', isEqualTo: idTrabajador)
//         .get();

//     // Verificar si se encontraron documentos en la colección "RelacionTrabajadores"
//     if (relacionSnapshot.docs.isNotEmpty) {
//       // Obtener el IDChaza del primer documento encontrado
//       String idChaza = relacionSnapshot.docs[0]['IDChaza'];

//       // Buscar en la colección "Chaza" por el idChaza
//       DocumentSnapshot chazaSnapshot =
//           await db.collection('Chaza').doc(idChaza).get();

//       // Verificar si se encontró el documento en la colección "Chaza"
//       if (chazaSnapshot.exists) {
//         // Obtener el ID del horario desde el campo "horario" del documento
//         String idHorario = chazaSnapshot['horario'];

//         // Buscar en la colección "Horario" por el idHorario
//         DocumentSnapshot horarioSnapshot =
//             await db.collection('Horario').doc(idHorario).get();

//         // Verificar si se encontró el documento en la colección "Horario"
//         if (horarioSnapshot.exists) {
//           // El horario existe, puedes realizar las operaciones que necesites con él
//           print('El horario existe');
//         } else {
//           print('El horario no existe');
//         }
//       } else {
//         print('La chaza no existe');
//       }
//     } else {
//       print('No se encontró la relación de trabajadores');
//     }
//   } catch (error) {
//     print('Error al buscar el horario: $error');
//   }
// }

Future<void> actualizarMapaEnFirestore(
    String idDocumento, Map<String, dynamic> nuevoMapa) async {
  try {
    await FirebaseFirestore.instance
        .collection('Horario')
        .doc(idDocumento)
        .update({'Dias': nuevoMapa});
    print('Actualización exitosa en Firestore');
  } catch (error) {
    print('Error al actualizar en Firestore: $error');
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

Future<void> buscarHorarioPorIdTrabajador(String idTrabajador) async {
  try {
    // Buscar en la colección "RelacionTrabajadores" por el idTrabajador
    QuerySnapshot relacionSnapshot = await db
        .collection('RelacionTrabajadores')
        .where('IDTrabajador', isEqualTo: idTrabajador)
        .get();

    // Verificar si se encontraron documentos en la colección "RelacionTrabajadores"
    if (relacionSnapshot.docs.isNotEmpty) {
      // Obtener el IDChaza del primer documento encontrado
      String idChaza = relacionSnapshot.docs[0]['IDChaza'];
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
          print(dias);
          reemplazarIdTrabajadorEnMapa(dias, idTrabajador);
          print("dias sin el id");
          print(dias);

          actualizarMapaEnFirestore(idHorario, dias);
          print("dias sin el id en la base de datos");
          print(dias);
        } else {
          print('El mapa "Dias" no contiene todos los días de la semana');
        }
      } else {
        print('El horario no existe');
      }
    }
  } catch (error) {
    print('Error al buscar el horario: $error');
  }
}



// Future<Map<String, dynamic>?> horas(String idHorario) async {
//   Map<String, List<String>> horasMap = {};

//   try {
//     var documentSnapshot = await db.collection('Horario').doc(idHorario).get();

//     if (documentSnapshot.exists) {
//       var data = documentSnapshot.data();
//       print(data);

//       return data;
//     } else {
//       throw Exception('El ID de Horario no existe');
//     }
//   } catch (error) {
//     throw Exception('Error al obtener el Horario: $error');
//   }
// }
