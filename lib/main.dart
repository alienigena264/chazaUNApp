import 'package:chazaunapp/view/login_vista.dart';
import 'package:chazaunapp/view/registro_trabajador.dart';
import 'package:chazaunapp/view/selector_vista.dart';
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
        '/registro/trabajador': (context) => const RegistroTrabajadorView(),
        '/registro/selector': (context) => const SelectorVista(),
        //'/Otra':(context) => const PageName(),
        //'/Services':(context) => const ServicesPage(),
      },
    );
  }
}