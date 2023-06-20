import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class PostuladosChaza extends StatefulWidget {
  const PostuladosChaza({super.key});

  @override
  _PostuladosChazaState createState() => _PostuladosChazaState();
}

class _PostuladosChazaState extends State<PostuladosChaza> {
  final TextEditingController _textFieldController = TextEditingController();
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
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Seleccionar horario',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontFamily: "Inder",
              fontWeight: FontWeight.normal,
            ),
          ),
          backgroundColor: colorPrincipal,
          toolbarHeight: 100.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () => _showAddSlotDialog(day),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(colorPrincipal)),
                    child: const Text('Añadir'),
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
    String startTime = '8:00';
    String endTime = '20:00';
    String selectedHour = '8:00';

    final List<String> hoursList = [
      '8:00',
      '8:30',
      '9:00',
      '9:30',
      '10:00',
      '10:30',
      '11:00',
      '11:30',
      '12:00',
      '12:30',
      '13:00',
      '13:30',
      '14:00',
      '14:30',
      '15:00',
      '15:30',
      '16:00',
      '16:30',
      '17:00',
      '17:30',
      '18:00',
      '18:30',
      '19:00',
      '19:30',
      '20:00',
    ];

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Añadir franja horaria para el $day'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text('Desde:'),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton<String>(
                          value: selectedHour,
                          hint: Text("Seleccionar hora"),
                          onChanged: (String? value) {
                            setState(() {
                              selectedHour = value!;
                              startTime = selectedHour;
                            });
                          },
                          items: hoursList.map((String hour) {
                            return DropdownMenuItem<String>(
                              value: hour,
                              child: Text(hour),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('Hasta:'),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton<String>(
                          value: selectedHour,
                          hint: Text('Seleccionar hora'),
                          onChanged: (String? value) {
                            setState(() {
                              selectedHour = value!;
                              endTime = selectedHour;
                            });
                          },
                          items: hoursList.map((String hour) {
                            return DropdownMenuItem<String>(
                              value: hour,
                              child: Text(hour),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final slot = 'Desde $startTime hasta $endTime';
                setState(() {
                  timeSlots.putIfAbsent(day, () => []).add(slot);
                });
                Navigator.pop(context);
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
