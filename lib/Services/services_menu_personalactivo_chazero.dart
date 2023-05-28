import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference collectionReferenceTrabajador = db.collection("Trabajador");

Future<List> getPersonalActivoPorchaza(String idChaza) async {
  List idsPersonal = [];
  List personal = [];
  print("otraprueba");

  final chazaRef = db.collection("Chaza").doc(idChaza);
  idsPersonal = await chazaRef.get().then((value) {
    return value.data()?["personal_activo"];
  });
  print(idsPersonal);

  for (var id in idsPersonal){
    final trabajadorRef = db.collection("Trabajador").doc(id);
    await trabajadorRef.get().then((value) {
      personal.add(value.data());
    });
  }
  print (personal);
  return personal;

}