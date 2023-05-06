import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';
class ConfiguracionVista extends StatefulWidget {
  const ConfiguracionVista({super.key});

  @override
  State<ConfiguracionVista> createState() => _ConfiguracionVistaState();
}

class _ConfiguracionVistaState extends State<ConfiguracionVista> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colorBackground,
      body: Center(child:Column(
        children: const [
          SizedBox(height: 380),
          Icon(Icons.design_services_outlined),
          Text('Estamos trabajando en esta funcionalidad'),
        ],
      ),)
    );
  }
}