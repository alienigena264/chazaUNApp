import 'package:chazaunapp/Services/gauth_service.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class MenuTrabajadorVista extends StatefulWidget {
  const MenuTrabajadorVista({super.key});
  @override
  State<MenuTrabajadorVista> createState() => _MenuTrabajadorVistaState();
}

class _MenuTrabajadorVistaState extends State<MenuTrabajadorVista> {
  String user = GAuthService().getUser();
  String email = GAuthService().getEmail();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: Center(
        child: Text("Hola suptierra $user, $email"),
      ),
    );
  }
}
