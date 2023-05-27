import 'package:chazaunapp/Services/Sprint2/info_personal_services.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class InfoCuenta extends StatefulWidget {
  const InfoCuenta({super.key});

  @override
  State<InfoCuenta> createState() => _InfoCuentaState();
}

const colorTextSuperior = Color(0xff2C2C2C);
const colorTextInferior = Color(0xffA7A7A7);

class _InfoCuentaState extends State<InfoCuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondoField,
      body: Column(children: [
        barraSuperior_(),
        const SizedBox(
          height: 15,
        ),
        fotoPerfil(),
        const SizedBox(
          height: 10,
        ),
        botonNombre(),
        const SizedBox(
          height: 5,
        ),
        botonApellido(),
        const SizedBox(
          height: 5,
        ),
        botonTelefono(),
        const SizedBox(
          height: 5,
        ),
        botonEmail(),
        const SizedBox(
          height: 5,
        ),
        botonContrasena(),
        const SizedBox(
          height: 10,
        ),
        visibilidadCuenta()
      ]),
    );
  }

  Stack barraSuperior_() {
    return Stack(children: [
      Container(
        color: colorPrincipal,
        height: 85,
        width: 500,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(children: [
                volverBoton_(),
                const Text(
                  "Configuración",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ]),
            ],
          ),
        ),
      ),
    ]);
  }

  Row fotoPerfil() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        fotoActual(),
        const SizedBox(width: 10),
        botonCambiar(),
      ],
    );
  }

  CircleAvatar fotoActual() {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
        'https://cnnespanol.cnn.com/wp-content/uploads/2016/08/juan-gabriel-pleno.jpg?quality=100&strip=info',
      ),
    );
  }

  Expanded botonCambiar() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: subirImagen(),
            child: const Text(
              "Editar foto de perfil",
              style: TextStyle(fontSize: 20, color: Color(0xff404040)),
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  TextButton botonNombre() {
    return TextButton(
        onPressed: cambiarNombre(),
        child: datosPersonales('Nombres', 'Juan Pablo'));
  }

  TextButton botonApellido() {
    return TextButton(
        onPressed: cambiarApellido(),
        child: datosPersonales('Apellidos', 'Garcia Otalora'));
  }

  TextButton botonTelefono() {
    return TextButton(
        onPressed: cambiarTelefono(),
        child: otrosDatos('Numero de telefono', '304***6075'));
  }

  TextButton botonEmail() {
    return TextButton(
        onPressed: cambiarEmail(),
        child: otrosDatos('Email', 'marco***@gmail.com'));
  }

  TextButton botonContrasena() {
    return TextButton(
        onPressed: cambiarContrasena(), child: otrosDatos('Contraseña', ''));
  }

  Row visibilidadCuenta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '   Cuenta visible',
          style: TextStyle(
              color: colorTextSuperior,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(3.14159),
          child: GFToggle(
            onChanged: (val) {},
            value: true,
            enabledThumbColor: Colors.white,
            enabledTrackColor: colorPrincipal,
            type: GFToggleType.ios,
          ),
        )
      ],
    );
  }

  Row datosPersonales(String tipo, name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tipo,
              style: const TextStyle(
                color: colorTextSuperior,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(color: colorTextInferior, fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
      ],
    );
  }

  Row otrosDatos(String tipo, dato) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  $tipo',
          style: const TextStyle(color: colorTextSuperior, fontSize: 20),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dato,
              style: const TextStyle(color: colorTextInferior, fontSize: 16),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ],
    );
  }

  TextButton volverBoton_() {
    return TextButton(
      onPressed: volverInicio_(),
      child: const Icon(
        Icons.arrow_back,
        size: 35,
        color: Colors.white,
      ),
    );
  }

  volverInicio_() {
    return () {
      //No modificar, esto directamente manda a la anterior ventana
      Navigator.pop(
        context,
      );
    };
  }

  subirImagen() {
    return () {
      Navigator.pushNamed(context, '/progreso');
    };
  }

  cambiarNombre() {
    return () async {
      if (FirebaseAuth.instance.currentUser != null) {
        await actualizarNombreChazero(FirebaseAuth.instance.currentUser?.uid, xxxxxxxxx,s);
      }
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/progreso');
    };
  }

  cambiarApellido() {
    return () async {
      if (FirebaseAuth.instance.currentUser != null) {
        await actualizarApellidoChazero(FirebaseAuth.instance.currentUser?.uid, xxxxxxxx,a);
      }
    };
  }

  cambiarTelefono() {
    return () async {
      if (FirebaseAuth.instance.currentUser != null) {
        await actualizarTelefonoChazero(FirebaseAuth.instance.currentUser?.uid, xxxxxxxxx);
      }
    };
  }

  cambiarEmail() {
    return () async {
      if (FirebaseAuth.instance.currentUser != null) {
        await actualizarEmailChazero(FirebaseAuth.instance.currentUser?.uid, xxxxxxxx);
      }
    };
  }

  cambiarContrasena() {
    return () {
      Navigator.pushNamed(context, '/contrasena');
    };
  }


}
