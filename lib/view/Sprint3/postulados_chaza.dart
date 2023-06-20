import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostuladosChaza extends StatefulWidget {
  @override
  _PostuladosChazaState createState() => _PostuladosChazaState();
/*
  final String selectedHour = '';

  final List<String> hoursList = [
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
    '7:30 PM',
    '8:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedHour,
      hint: Text('Seleccionar hora'),
      onChanged: (String? value) {
        setState(() {
          selectedHour = value!;
        });
      },
      items: hoursList.map((String hour) {
        return DropdownMenuItem<String>(
          value: hour,
          child: Text(hour),
        );
      }).toList(),
    );
  }
}
  */
}

class _PostuladosChazaState extends State<PostuladosChaza> {
  TextEditingController _textFieldController = TextEditingController();
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
          title: Text(
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
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(colorPrincipal)),
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
    String startTime = '800';
    String endTime = '830';

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
                  Text('Desde:'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: 
                    
                    
                    TextField(
                      controller: _textFieldController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^([8-9]|1[0-8])00$|^([8-9]|1[0-8])30$'),
                        ),
                      ],
                      decoration: InputDecoration(
                        hintText: '800',
                        labelText: 'Hora',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text('Hasta:'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          endTime = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: '1930',
                        labelText: 'Hora',
                      ),
                    ),
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
                final slot = 'Desde $startTime hasta $endTime';
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
