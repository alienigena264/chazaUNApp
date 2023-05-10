import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class RegistroChazeroVista extends StatefulWidget {
  const RegistroChazeroVista({super.key});

  @override
  State<RegistroChazeroVista> createState() => _RegistroChazeroVistaState();
}

class _RegistroChazeroVistaState extends State<RegistroChazeroVista> {
  // controladores de todos los campos de texto
  final emailController = TextEditingController();
  final password = TextEditingController();
  final primerNombreController = TextEditingController();
  final segundoNombreController = TextEditingController();
  final primerApellidoController = TextEditingController();
  final segundoApellidoController = TextEditingController();
  final telefonoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: colorBackground,
        body: SingleChildScrollView(
            child: Container(
          color: colorBackground,
          child: Column(
            children: [
              Stack(
                children: [
                  // Contenedor con texto y fondo
                  barraSuperior_(),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              largeInput("Correo", Icons.mail, false,
                  TextInputType.emailAddress, emailValidator),
              largeInput("Contraseña", Icons.password, true, TextInputType.name,
                  emailValidator),
              shortInput("Primer Nombre", "Segundo Nombre",
                  primerNombreController, segundoNombreController),
              shortInput("Primer Apellido", "Segundo Apellido",
                  primerApellidoController, segundoApellidoController),
              largeInput("Telefono", Icons.phone, false, TextInputType.phone,
                  emailValidator),
              //aca debe ir el de confirmar
              const SizedBox(height: 40),
              registroButtom_()
            ],
          ),
        )),
      ),
    );
  }

  Row shortInput(
      String primerCampo,
      String segundoCampo,
      TextEditingController controllerPrimerCampo,
      TextEditingController controllerSegundoCampo) {
    return Row(
      children: [
        miniButom(30, 20, primerCampo, controllerPrimerCampo),
        miniButom(10, 30, segundoCampo, controllerSegundoCampo),
      ],
    );
  }

  Expanded miniButom(double paddingIzq, double paddingDer, String campo,
      TextEditingController controller) {
    return Expanded(
      child: Container(
          padding:
              EdgeInsets.only(left: paddingIzq, right: paddingDer, top: 20),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            validator: (String? val) => val!.isEmpty ? "enter valid" : null,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: colorFondoField,
              labelText: campo,
              labelStyle: TextStyle(color: Colors.grey.shade700),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          )),
    );
  }

  Container largeInput(String label, IconData dibujo, bool oculto,
      TextInputType teclado, String? Function(String?) validator) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          keyboardType: teclado,
          obscureText: oculto,
          decoration: InputDecoration(
            filled: true,
            fillColor: colorFondoField,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey.shade700),
            suffixIcon: Icon(dibujo),
          ),
        ));
  }

  SizedBox barraSuperior_() {
    return SizedBox(
      height: 186.0,
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
              'CHAZERO', // el texto que quieres mostrar
              style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 64.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton registroButtom_() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorChazero,
          minimumSize: const Size(340, 55),
          // double.infinity is the width and 30 is the height
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/menu/chazero');
          }
        },
        child: const Text(
          "Registrarme",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ));
  }

  String? emailValidator(String? field) {
    if (EmailValidator.validate(field!)) {
      return null;
    }
    return "email must be valid";
  }

  //

}
