import 'package:flutter/material.dart';

class SelectorVista extends StatelessWidget {
  const SelectorVista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children:const  [
                  Text(
                    'Registrarse como:',
                    style: TextStyle(
                        color:  Color(0xff00B5C0), fontSize: 26),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              trabajadorButton(context),
              const SizedBox(
                height: 88,
              ),
              chazeroButton(context),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton trabajadorButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff7B1FA2),
        minimumSize:
        const Size(316, 55), // double.infinity is the width and 30 is the height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      onPressed: registrarseTrabajador(context),
      child: const Text(
        "TRABAJADOR",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  ElevatedButton chazeroButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffEFB810),
        minimumSize:
        const Size(316, 55), // double.infinity is the width and 30 is the height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      onPressed: registrarseChazero(context),
      child: const Text(
        "CHAZERO",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  Function() registrarseTrabajador(BuildContext context) {
    return () {
      Navigator.pushNamed(context, '/registro/trabajador');
    };
  }

  Function() registrarseChazero(BuildContext context) {
    return () {
      Navigator.pushNamed(context, '/registro/chazero');
    };
  }
}
