import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference collectionReferenceTrabajador = db.collection("Trabajador");

Future<List> getPersonalActivoPorchaza(String idChaza) async {
  List idsPersonal = [];
  List personal = [];
  print("otraprueba");

  final chazaRef = db.collection("Chaza").doc(idChaza);
  chazaRef.get().then((value) {
    idsPersonal = value.data()?["personal_activo"];
  });

  for (var id in idsPersonal){
    final trabajadorRef = db.collection("Personal").doc(id.toString());
    trabajadorRef.get().then((value) {
      personal.add(value.data());
    });
  }
  print(idsPersonal);
  print (personal);
  return personal;

}