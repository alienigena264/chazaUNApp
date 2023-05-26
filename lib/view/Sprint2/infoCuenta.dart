import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

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
        TextButton(
            onPressed: cambiarNombre(),
            child: datosPersonales('Nombres', 'Juan Pablo')),
        const SizedBox(
          height: 5,
        ),
        TextButton(
            onPressed: cambiarNombre(),
            child: datosPersonales('Apellidos', 'Garcia Otalora')),
        const SizedBox(
          height: 5,
        ),
        TextButton(onPressed: cambiarNombre(), child: otrosDatos('Numero de telefono', '304***6075')),
      ]),
    );
  }

  Row otrosDatos(String tipo,dato) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        const SizedBox(
          width: 5,
        ),
        Text(
          tipo,
          style: const TextStyle(color: colorTextSuperior, fontSize: 20),
        ),
        Text(
          dato,
          style: const TextStyle(color: colorTextInferior, fontSize: 16),
        ),
        const Icon(Icons.arrow_forward_ios, color: Colors.black ,)
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

  CircleAvatar fotoActual() {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
        'https://cnnespanol.cnn.com/wp-content/uploads/2016/08/juan-gabriel-pleno.jpg?quality=100&strip=info',
      ),
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
          child: Row(children: [
            volverBoton_(),
            const Text(
              "Configuración",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )
          ]),
        ),
      ),
    ]);
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
    return () {
      Navigator.pushNamed(context, '/progreso');
    };
  }
}
