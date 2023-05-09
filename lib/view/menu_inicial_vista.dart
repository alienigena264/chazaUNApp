import 'package:flutter/material.dart';
import 'package:chazaunapp/Models/menu_inicial_model.dart';

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
            Container(
              height: 300.0,
              width: 300.0,
              child: chazas(),
            )
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
            borderRadius: BorderRadius.circular(10),
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

  ElevatedButton chazaBottom() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffEFB810),
          minimumSize: const Size(
              120, 39), // double.infinity is the width and 30 is the height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Entrar",
          style:
              TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Inder"),
        ));
  }

  ListView chazas() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 30);
        },
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: chazaList.length,
        itemBuilder: (context, index) {
          Chaza chaza = chazaList[index];
          return card(chaza);
        });
  }

  Widget card(chaza) => Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 131, 131, 131),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: 50,
        height: 250,
        child: Column(children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                chaza.imagen,
                height: 112,
                width: 150,
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  chaza.nombre, // el texto que quieres mostrar
                  style: const TextStyle(
                      color: Colors.black, // Establece el color del texto
                      fontSize: 30.0, // Establece el tamaño del texto
                      fontFamily: "Inder",
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  chaza.pagoHora,
                  style: const TextStyle(
                      color: Color(0xff7B1FA2), // Establece el color del texto
                      fontSize: 20.0, // Establece el tamaño del texto
                      fontFamily: "Inder",
                      fontWeight: FontWeight.normal),
                )
              ]),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_rounded,
                        color: Color(0xff919191), size: 16.0),
                    Text(
                      chaza.ubicacion,
                      style: const TextStyle(
                          color: Color(0xff919191),
                          fontSize: 14.5,
                          fontFamily: "Inder",
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [chazaBottom()],
                )
              ],
            ),
          ),
        ]),
      );
}
