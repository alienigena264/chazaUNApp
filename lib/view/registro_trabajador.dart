import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

//Titulo del banner
const String _title = 'Registro';
bool isChecked = false; //Aceptar terminos y condiciones

class RegistroTrabajadorView extends StatefulWidget {
  const RegistroTrabajadorView({super.key});

  @override
  State<RegistroTrabajadorView> createState() => _RegistroTrabajadorState();
}

class _RegistroTrabajadorState extends State<RegistroTrabajadorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xffF6F6F6),
          alignment: Alignment.center,
          child: Column(
            children: const [
              Title(),
              Flexible(flex: 1, child:SizedBox(
                height: 300,
              )),
              LoginButton(),
              Center(child: AgreeCheck()),
            ],
          )),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});
// Banner azulito bonito xd
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              _title, // el texto que quieres mostrar
              style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 55.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButton();
}

class _LoginButton extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      text: 'Ingresar con google unal',
      onPressed: () {},
    );
  }
}

class AgreeCheck extends StatefulWidget {
  const AgreeCheck({super.key});

  @override
  State<AgreeCheck> createState() => _Checkbox();
}

class _Checkbox extends State<AgreeCheck> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xff7B1FA2);
      }
      return const Color(0xff00B5C0);
    }

    return SizedBox(
        width: 250.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Checkbox(
                checkColor: const Color(0xffF6F6F6),
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
            const Expanded(
                child: Text(
              'Acepto los términos y condiciones.', // el texto que quieres mostrar
              style: TextStyle(
                  color: Colors.black, // Establece el color del texto
                  fontSize: 12.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
            )),
          ],
        ));
  }
}
