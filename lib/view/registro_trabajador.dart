import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'colors.dart';
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
          color: colorBackground,
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
          color: colorPrincipal,
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
        return colorTrabajador;
      }
      return colorPrincipal;
    }

    return SizedBox(
        width: 250.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Checkbox(
                checkColor: colorBackground,
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
