import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class PostuladosChaza extends StatelessWidget {
  final List<String> daysOfWeek = const [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado'
  ];

  const PostuladosChaza({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
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
                children:
                    daysOfWeek.map((day) => DaySchedule(day: day)).toList(),
              ),
            ],
          ),
        ));
  }
}

class DaySchedule extends StatefulWidget {
  final String day;

  const DaySchedule({super.key, required this.day});

  @override
  State<DaySchedule> createState() => _DayScheduleState();
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
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            return Text(timeSlots[index]);
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              timeSlots.add('Desde __:__ hasta __:__');
            });
          },
          child: const Text('+ Añadir franja nueva'),
        ),
      ],
    );
  }
}
