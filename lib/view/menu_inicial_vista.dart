import 'package:flutter/material.dart';

class MenuInicialVistaView extends StatefulWidget {
  const MenuInicialVistaView({super.key});

  @override
  State<MenuInicialVistaView> createState() => _MenuInicialVistaView();
}

class _MenuInicialVistaView extends State<MenuInicialVistaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffF6F6F6),
        child: Column(
          children: [
            Stack(
              children: [
                // Contenedor con texto y fondo
                SizedBox(
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
                          'Usuario', // el texto que quieres mostrar
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
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                chefBottom_(),
                cubiertosBottom_(),
                masBottom_(),
              ],
            ),
            const SizedBox(
              width: 55,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Chazas', // el texto que quieres mostrar
                        style: TextStyle(
                            color: Colors.black, // Establece el color del texto
                            fontSize: 30.0, // Establece el tamaño del texto
                            fontFamily: "Inder",
                            fontWeight: FontWeight.normal),
                      )),
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              chazaBottom_('SexChaza', 'Sociologia', '40k'),
              chazaBottom_('RubikChaza', 'Entrada 30', '40k')
            ])
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Usuario"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Configuracion")
        ],
      ),
    );
  }

  chefBottom_() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Material(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
                //Coidgo extra para funcionar boton
                splashColor: Colors.black26,
                onTap: () {},
                child: Image.asset(
                  'assets/imagenes/chef.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ))));
  }

  cubiertosBottom_() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Material(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
                //Coidgo extra para funcionar boton
                splashColor: Colors.black26,
                onTap: () {},
                child: Image.asset(
                  'assets/imagenes/snack.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ))));
  }

  masBottom_() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Material(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
                //Coidgo extra para funcionar boton
                splashColor: Colors.black26,
                onTap: () {},
                child: Image.asset(
                  'assets/imagenes/mas.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ))));
  }

  chazaBottom_(String nombre, String ubicacion, String precio) {
    return InkWell(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Card(
            child: Column(
          children: [Text(nombre), Text(ubicacion), Text(precio)],
        )),
      ),
    );
  }
}
