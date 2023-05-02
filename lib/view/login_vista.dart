import 'package:flutter/material.dart';

class LoginVista extends StatefulWidget {
  const LoginVista({super.key});

  @override
  State<LoginVista> createState() => _LoginVistaState();
}

class _LoginVistaState extends State<LoginVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffF6F6F6),
          child: Column(
            children: [
              Stack(
                children: [
                  // Contenedor con texto y fondo
                  barraSuperior_(),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              inputEmail_(),
              inputPassword_(),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  olvidoPassButtom_(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              inicioSesionButtom_(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 55,
                  ),
                  const Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  registrarseButtom_(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox barraSuperior_() {
    return SizedBox(
                height: 186.0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(
                        0xff00B5C0), // Establece el color de fondo del contenedor con el texto
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                    ),
                  ),
                  child: const Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Ingresar', // el texto que quieres mostrar
                        style: TextStyle(
                            color:
                                Colors.white, // Establece el color del texto
                            fontSize: 55.0, // Establece el tamaño del texto
                            fontFamily: "Inder",
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              );
  }

  inputEmail_() {
    return Container(
      margin: const EdgeInsets.only(top: 0.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          hintText: 'Correo',
          hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  inputPassword_() {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: const TextField(
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          hintText: 'Contraseña',
          hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  TextButton olvidoPassButtom_() {
    return TextButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.all(1)),
        onPressed: recuperarPassword_(),
        child: const Text(
          '¿Olvidó su contraseña?',
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: "Inder",
              fontWeight: FontWeight.bold),
        ));
  }

  ElevatedButton inicioSesionButtom_() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEFB810),
          minimumSize: const Size(
              340, 55), // double.infinity is the width and 30 is the height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        onPressed: verificar_(),
        child: const Text(
          "Iniciar sesión",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ));
  }

  TextButton registrarseButtom_() {
    return TextButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 10)),
        onPressed: registrarse_(),
        child: const Text(
          'Regístrate aquí',
          style: TextStyle(
              color: Color(0xffEFB810),
              fontSize: 15,
              fontFamily: "Inder",
              fontWeight: FontWeight.bold),
        ));
  }

  recuperarPassword_() {
    return () {
      print('Se recupero');
      Navigator.pushNamed(context, '/recuperarpswrd');
    };
  }

  verificar_() {
    return () {
      print("Inicio sesion");
    };
  }

  registrarse_() {
    return () {
      Navigator.pushNamed(context, '/registro/trabajador');
    };
  }
}
