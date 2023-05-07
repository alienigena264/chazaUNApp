import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class EnProgreso extends StatefulWidget {
  const EnProgreso({super.key});

  @override
  State<EnProgreso> createState() => _EnProgresoState();
}

class _EnProgresoState extends State<EnProgreso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBackground,
        body: Center(
          child: Column(
            children: const [
              SizedBox(height: 320),
              Icon(
                Icons.design_services_outlined,
                size: 80,
                color: colorPrincipal,
              ),
              Center(
                child: Text(
                  '    Estamos trabajando en esta\n              funcionalidad',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ],
          ),
        )
      );
  }
}
