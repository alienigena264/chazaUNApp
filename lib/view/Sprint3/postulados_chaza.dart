import 'package:chazaunapp/Services/Sprint3/crearPostulacion.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class PostuladosChaza extends StatefulWidget {
  final String idChaza;
  const PostuladosChaza({required this.idChaza, super.key});

  @override
  _PostuladosChazaState createState() => _PostuladosChazaState();
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
  Map<String, List<int>> horarioPostulacion = {};
  String chaza = '';

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    chaza = ModalRoute.of(context)?.settings.arguments as String;
    print("chaza $chaza");

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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
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
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => crearPostulacion(horarioPostulacion, chaza),
                  child: Text('Añadir'),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(colorPrincipal)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddSlotDialog(String day) async {
    String startTime = '800';
    String endTime = '830';
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
                  Text('Desde:'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child:
                    StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton<String>(
                          value: selectedHour,
                          hint: Text('Seleccionar hora'),
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
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text('Hasta:'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child:
                    StatefulBuilder(
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
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final slot = 'Desde $startTime hasta $endTime';
                setState(() {
                  timeSlots.putIfAbsent(day, () => []).add(slot);
                  convertirHorarioALista(startTime, endTime, day);
                  print(horarioPostulacion);
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

  void convertirHorarioALista(String horaInicio, String horaFin, String dia){
    
    List<int> horario = [];

    //List horaInicioParsed = parseHour(horaInicio);
   // List horaFinParsed = parseHour(horaFin);

    String horaInicioConvertida = horaInicio.replaceAll(":", "");
    String horaFinConvertida = horaFin.replaceAll(":", "");


    print (horaInicioConvertida);
    print (horaFinConvertida);
    //int soloHoraInicio = horaInicioParsed[0];
    //int soloMinutosInicio = horaInicioParsed[1];

    //int soloHoraFin = horaFinParsed[0];
    //int soloMinutosFin = horaFinParsed[1];

    List<String> horas = [
      "800",
      "830",
      "900",
      "930",
      "1000",
      "1030",
      "1100",
      "1130",
      "1200",
      "1230",
      "1300",
      "1330",
      "1400",
      "1430",
      "1500",
      "1530",
      "1600",
      "1630",
      "1700",
      "1730",
      "1800",
      "1830",
      "1900",
      "1930",
    ];

    for (var hora in horas){
      if (hora == horaInicioConvertida){
        horario.add(int.parse(horaInicioConvertida));
      }
      else if (hora != horaFinConvertida &&
          int.parse(horaInicioConvertida) <= int.parse(hora) &&
          int.parse(hora) <= int.parse(horaFinConvertida)
      ){
        horario.add(int.parse(hora));
      }
    }
    List<int>? temp = [...?horarioPostulacion[dia], ...horario];
    temp.sort();
    horarioPostulacion[dia] = temp;

  }

  List<int> parseHour(String hora){
    List<int> parsedHour = [];

    if (hora.length == 3) {
      parsedHour.add(int.parse(hora.substring(0, 1)));
      parsedHour.add(int.parse(hora.substring(1, 3)));
    } else {
      parsedHour.add(int.parse(hora.substring(0, 2)));
      parsedHour.add(int.parse(hora.substring(2, 4)));
    }

    return parsedHour;
  }
}
