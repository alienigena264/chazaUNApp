import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class MenuTrabajadorVista extends StatefulWidget {
  const MenuTrabajadorVista({super.key});

  @override
  State<MenuTrabajadorVista> createState() => _MenuTrabajadorVistaState();
}

class _MenuTrabajadorVistaState extends State<MenuTrabajadorVista> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorBackground,
      body: Center(child: Text("Hola suptierra"),),
    );
  }
}