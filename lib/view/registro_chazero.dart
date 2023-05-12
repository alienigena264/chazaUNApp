import 'package:chazaunapp/view/menu_inicial_chazero_vista.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:chazaunapp/Services/services_registrochazero.dart';

class RegistroChazeroVista extends StatefulWidget {
  const RegistroChazeroVista({super.key});

  @override
  State<RegistroChazeroVista> createState() => _RegistroChazeroVistaState();
}

class _RegistroChazeroVistaState extends State<RegistroChazeroVista> {
  // controladores de todos los campos de texto
  final emailController = TextEditingController();
  final contrasenaController = TextEditingController();
  final primerNombreController = TextEditingController();
  final segundoNombreController = TextEditingController();
  final primerApellidoController = TextEditingController();
  final segundoApellidoController = TextEditingController();
  final telefonoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? emailValidator_;
  String? contrasenaValidator_;
  String? telefonoValidator_;
  String? primerNombreValidator_;
  String? segundoNombreValidator_;
  String? primerApellidoValidator_;
  String? segundoApellidoValidator_;

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
                  TextInputType.emailAddress, emailValidator_, emailController),
              largeInput("Contraseña", Icons.password, true, TextInputType.name,
                  contrasenaValidator_, contrasenaController),
              shortInput("Primer Nombre", "Segundo Nombre",
                  primerNombreController, segundoNombreController,
              primerNombreValidator_, segundoNombreValidator_),
              shortInput("Primer Apellido", "Segundo Apellido",
                  primerApellidoController, segundoApellidoController,
              primerApellidoValidator_, segundoApellidoValidator_),
              largeInput("Telefono", Icons.phone, false, TextInputType.phone,
                  telefonoValidator_, telefonoController),
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
      TextEditingController controllerSegundoCampo,
      String? primerCampoValidator,
      String? segundoCampovalidator) {
    return Row(
      children: [
        miniButom(30, 20, primerCampo, controllerPrimerCampo, primerCampoValidator),
        miniButom(10, 30, segundoCampo, controllerSegundoCampo, segundoCampovalidator),
      ],
    );
  }

  Expanded miniButom(double paddingIzq, double paddingDer, String campo,
      TextEditingController controller, String? validator) {
    return Expanded(
      child: Container(
          padding:
              EdgeInsets.only(left: paddingIzq, right: paddingDer, top: 20),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            validator: (value) {
              return validator;
            },
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
      TextInputType teclado, String? validator,
      TextEditingController controller) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value){
            return validator;
          },
          keyboardType: teclado,
          obscureText: oculto,
          controller: controller,
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
        onPressed: () async {
          var emailResponse = await emailValidator(emailController.text);
          var contrasenaResponse = await contrasenaValidator(contrasenaController.text);
          var telefonoResponse = await telefonoValidator(telefonoController.text);
          var primerNombreResponse = await nombreValidator(primerNombreController.text);
          var segundoNombreResponse = await nombreValidator(segundoNombreController.text);
          var primerApellidoResponse = await nombreValidator(primerApellidoController.text);
          var segundoApellidoResponse = await nombreValidator(segundoApellidoController.text);

          setState(() {
            emailValidator_ = emailResponse;
            contrasenaValidator_ = contrasenaResponse;
            telefonoValidator_ = telefonoResponse;
            primerNombreValidator_ = primerNombreResponse;
            segundoNombreValidator_ = segundoNombreResponse;
            primerApellidoValidator_ = primerApellidoResponse;
            segundoApellidoValidator_ = segundoApellidoResponse;
          });
          if (_formKey.currentState!.validate()){
            crearChazero(emailController.text, contrasenaController.text,
                primerNombreController.text, segundoNombreController.text,
                primerApellidoController.text, segundoApellidoController.text,
                telefonoController.text);
            if (context.mounted){
              await goMenu();
            }
          }
        },
        child: const Text(
          "Registrarme",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ));
  }

  Future<String?> emailValidator(String? field)  async {

    if (await emailExists(field)){
      return "Este correo ya existe";
    }
    else if(EmailValidator.validate(field!) == false){
      return "Correo invalido";
    }
    else return null;

  }

  Future<String?> contrasenaValidator(String? field) async {

    /*
    al menos una mayuscula
    al menos una minuscula
    al menos un digito
    al menos un caracter especial (!@#\$&*~)
    minimo 8 caracteres
     */
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (field!.isEmpty){
      return "Por favor ingrese su contrasena";
    } else if (!regex.hasMatch(field)){
      return "Ingrese una contrasena valida";
    }
    else {
      return null;
    }
  }

  Future<String?> telefonoValidator(String? field) async {
    if (field!.isEmpty){
      return "Por favor ingrese su numero";
    }
    else if (field.length != 10){
      return "Ingrese un numero valido";
    }
    else {
      return null;
    }
  }
  
  Future<String?> nombreValidator(String? field) async{
    RegExp regExp = RegExp(r"^[a-zA-Z]+$");
    if (field!.isEmpty){
      return "Por favor ingrese su nombre";
    }
    else if (!regExp.hasMatch(field)){
      "Ingrese un nombre valido";
    }
  }
  goMenu() async {
    //Vuelve al inicio y borra lo anterior(login, registro y trabajador) para que no se pueda regresar al registro una vez ingresado,
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const MenuChazeroVista(),
      ),
      //Esta funcion es para decidir hasta donde hacer pop, ej: ModalRoute.withName('/'));, como está ahí borra todoo
          (_) => false,
    );
  }


}
