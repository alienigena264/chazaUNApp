import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class PostuladosChaza extends StatefulWidget {
  @override
  _PostuladosChazaState createState() => _PostuladosChazaState();
}

class _PostuladosChazaState extends State<PostuladosChaza> {
  List<String> daysOfWeek = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
  ];
  Map<String, List<String>> timeSlots = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Franjas Horarias'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: daysOfWeek.length,
            itemBuilder: (context, index) {
              String day = daysOfWeek[index];
              List<String> slots = timeSlots[day] ?? [];

              return ExpansionTile(
                title: Text(day),
                children: [
                  if (slots.isEmpty)
                    ListTile(
                      title: Text('No tienes franjas horarias el $day'),
                    ),
                  ...slots.map((slot) => ListTile(
                        title: Text(slot),
                      )),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () => _showAddSlotDialog(day),
                    child: Text('Añadir'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showAddSlotDialog(String day) async {
    TimeOfDay? startTime = TimeOfDay.now();
    TimeOfDay? endTime = TimeOfDay.now();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Añadir franja horaria para $day'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('Desde:'),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: startTime!,
                      );
                      if (selectedTime != null) {
                        setState(() {
                          startTime = selectedTime;
                        });
                      }
                    },
                    child: Text('Seleccionar hora'),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text('Hasta:'),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: endTime!,
                      );
                      if (selectedTime != null) {
                        setState(() {
                          endTime = selectedTime;
                        });
                      }
                    },
                    child: Text('Seleccionar hora'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final slot =
                    'Desde ${startTime!.format(context)} hasta ${endTime!.format(context)}';
                setState(() {
                  timeSlots.putIfAbsent(day, () => []).add(slot);
                });
                Navigator.pop(context);
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}

