import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../colors.dart';

class HorarioChazaVista extends StatefulWidget {
  const HorarioChazaVista({super.key});

  @override
  State<HorarioChazaVista> createState() => _HorarioChazaVistaState();
}

class _HorarioChazaVistaState extends State<HorarioChazaVista> {
  String chazaNombre = 'El parchadero';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        barraSuperior_(chazaNombre),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 24, top: 10, right: 24),
          child: Text(
            'A continuación verás el horario actual de la chaza, Evita seleccionar horarios que ya esten ocupados en tu postulación',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          width: 330,
          height: 350,
          child: SfCalendar(
            view: CalendarView.week,
            timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 8,
              endHour: 20
            ),
          ),
        ),
        const SizedBox( height: 10,),
        volverButtom()
      ],
    ));
  }

  SizedBox barraSuperior_(String nombreChaza) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height * 0.25;
    return SizedBox(
      height: screenHeight,
      child: Container(
        decoration: const BoxDecoration(
          color:
              colorPrincipal, // Establece el color de fondo del contenedor con el texto
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Horarios disponibles', // el texto que quieres mostrar
                  style: TextStyle(
                      color: Colors.white, // Establece el color del texto
                      fontSize: 35.0, // Establece el tamaño del texto
                      fontFamily: "Inder",
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  nombreChaza, // el texto que quieres mostrar
                  style: const TextStyle(
                      color: colorTrabajador, // Establece el color del texto
                      fontSize: 40.0, // Establece el tamaño del texto
                      fontFamily: "Open sans",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton volverButtom() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrincipal,
          minimumSize: const Size(
              340, 55), // double.infinity is the width and 30 is the height
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          "Volver",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}
