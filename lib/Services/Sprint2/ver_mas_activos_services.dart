import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

Future<String> getCorreoFromFirestore(String id) async {
  final document = db.collection('Trabajador').doc(id);
  final snapshot = await document.get();
  if (snapshot.exists) {
    final data = snapshot.data();
    if (data != null && data['correo'] != null) {
      return data['correo'];
    } else {
      print('Correo no encontrado en Firebase');
    }
  } else {
    print('Documento no encontrado en Firebase');
  }
  return ''; // Valor predeterminado si no se encuentra el teléfono en Firebase
}
