import 'package:flutter/material.dart';

import '../colors.dart';

class RegistrarChaza extends StatefulWidget {
  const RegistrarChaza({super.key});

  @override
  State<RegistrarChaza> createState() => _RegistrarChazaState();
}

class _RegistrarChazaState extends State<RegistrarChaza> {
  List listTiposChaza = ['Cocina', 'Prefabricado', 'Otros'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SingleChildScrollView(
        child: Container(
          color: colorBackground,
          child: Column(children: [
            barraSuperior_(),
            const SizedBox(
              height: 15,
            ),
            cambiarImagen(),
            const SizedBox(
              height: 20,
            ),
            modeloDatos('Nombre de la chaza'),
            const SizedBox(
              height: 15,
            ),
            modeloDatos('Ubicación'),
            const SizedBox(
              height: 15,
            ),
            modeloDatos('Sueldo'),
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(top: 0.0),
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: tipoChaza()),
            const SizedBox(
              height: 15,
            ),
            modeloDatos('Descripción'),
            const SizedBox(
              height: 15,
            ),
            registrarBoton_()
          ]),
        ),
      ),
    );
  }

  ElevatedButton registrarBoton_() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorChazero,
          minimumSize: const Size(
              180, 50), // double.infinity is the width and 30 is the height
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        ),
        onPressed: () {},
        child: const Text(
          "Registrar",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }

  DropdownButtonFormField<Object> tipoChaza() {
    return DropdownButtonFormField<Object>(
      items: listTiposChaza.map((name) {
        return DropdownMenuItem<Object>(
          value: name,
          child: Text(name),
        );
      }).toList(),
      onChanged: (Object? value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: colorFondoField,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: colorFondoField, // Cambia el color del borde aquí
            width: 2.0, // Cambia el ancho del borde si es necesario
          ),
        ),
        labelText: 'Tipo de Chaza',
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
          fontFamily: "Inder",
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  modeloDatos(String tipo) {
    return Container(
      margin: const EdgeInsets.only(top: 0.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: colorFondoField,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: colorFondoField, // Cambia el color del borde aquí
              width: 2.0, // Cambia el ancho del borde si es necesario
            ),
          ),
          labelText: tipo,
          labelStyle: TextStyle(
            color: Colors.grey.shade700,
            fontFamily: "Inder",
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  ElevatedButton cambiarImagen() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: imagenBotonStyle(),
    );
  }

  Stack imagenBotonStyle() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png',
            fit: BoxFit.cover,
            width: 160,
            height: 130,
          ),
        ),
        const Positioned(
          top: 5,
          left: 0,
          width: 160,
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.add_a_photo,
                size: 45,
                color: colorChazero,
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox barraSuperior_() {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height*0.25;
    return SizedBox(
      height: screenHeight,
      child: Container(
        decoration: const BoxDecoration(
          color:
              colorPrincipal, // Establece el color de fondo del contenedor con el texto
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
        ),
        child: const Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Registrar \n Chaza', // el texto que quieres mostrar
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 60.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
