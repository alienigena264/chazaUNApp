import 'package:flutter/material.dart';
import 'package:chazaunapp/view/colors.dart';

class postulados_chaza extends StatelessWidget {
  final List<String> daysOfWeek = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: const Text(
            "Seleccionar horarios",
            style: TextStyle(
                color: Colors.white, // Establece el color del texto
                fontSize: 30.0, // Establece el tamaño del texto
                fontFamily: "Inder",
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: colorPrincipal,
        )),
        body: TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: daysOfWeek
                  .map((day) => DaySchedule(day: day))
                  .toList(),
            ),
          ],
        ),
      );
  }
}

class DaySchedule extends StatefulWidget {
  final String day;

  DaySchedule({required this.day});

  @override
  _DayScheduleState createState() => _DayScheduleState();
}

class _DayScheduleState extends State<DaySchedule> {
  List<String> timeSlots = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.day,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            return Text(timeSlots[index]);
          },
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              timeSlots.add('Desde __:__ hasta __:__');
            });
          },
          child: Text('+ Añadir franja nueva'),
        ),
      ],
    );
  }
}