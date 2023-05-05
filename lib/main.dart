import 'package:chazaunapp/view/Sprint2/configuracion_vista.dart';
import 'package:chazaunapp/view/Sprint2/perfil_chazero_vista.dart';
import 'package:chazaunapp/view/Sprint2/perfil_trabajador_vista.dart';
import 'package:chazaunapp/view/codigo_vista.dart';
import 'package:chazaunapp/view/login_vista.dart';
import 'package:chazaunapp/view/menu_inicial_vista.dart';
import 'package:chazaunapp/view/recuperar_contrasena_vista.dart';
import 'package:chazaunapp/view/registro_chazero.dart';
import 'package:chazaunapp/view/registro_trabajador.dart';
import 'package:chazaunapp/view/selector_vista.dart';
import 'package:chazaunapp/view/menu_inicial_chazero_vista.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/', //prueba
      routes: {
        '/': (context) => const LoginVista(),
        '/contrasena': (context) => const ContrasenaVista(),
        '/registro/selector':(context) => const SelectorVista(),
        '/registro/trabajador': (context) => const RegistroTrabajadorView(),
        '/registro/chazero': (context) => const RegistroChazeroVista(),
        '/registro/chazero/codigo': (context) => const CodigoVista(),
        '/menu/chazero':(context) => const MenuChazeroVista(),
        '/menu/trabajador':(context) => const MenuTrabajadorVista(),
        '/menu/trabajador/perfil':(context) => const PerfilTrabajadorVista(),
        '/menu/chazero/perfil':(context) => const PerfilChazeroVista(),
        '/menu/configuracion':(context) => const ConfiguracionVista(),
      },
    );
  }
}