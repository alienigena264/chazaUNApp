// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../colors.dart';
import 'package:intl/intl.dart';

class HorarioChazaVista extends StatefulWidget {
  const HorarioChazaVista({super.key});

  @override
  State<HorarioChazaVista> createState() => _HorarioChazaVistaState();
}

var horas = {
  '800': '',
  '830': '',
  '900': '',
  '930': '',
  '1000': '',
  '1030': '',
  '1100': '',
  '1130': '',
  '1200': '',
  '1230': '',
  '1300': '',
  '1330': '',
  '1400': 'oKnw05Cp9BZ6huQAvJTjW9X4XB62',
  '1430': '',
  '1500': 'oKnw05Cp9BZ6huQAvJTjW9X4XB62',
  '1530': '',
  '1600': '',
  '1630': '',
  '1700': '',
  '1730': '',
  '1800': '',
  '1830': '',
  '1900': '',
  '1930': ''
};
var dias = {
  'Lunes': horas,
  'Martes': horas,
  'Miercoles': horas,
  'Jueves': horas,
  'Viernes': horas,
  'Sabado': horas,
};

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
            timeSlotViewSettings:
                const TimeSlotViewSettings(startHour: 8, endHour: 20),
            dataSource: MeetingDataSource(_getDataSource(dias)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
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

  List<Meeting> _getDataSource(Map dias) {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 8);
    print('La fecha de hoy es');
    print(today.day);
    final DateTime endTime = startTime.add(const Duration(minutes: 180));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    //Aca se recorre el mapa de los horarios de la chaza
    for (var key in dias.keys) {
      print('Día: $key');
      var horasMap = dias[key];
      for (var horaKey in horasMap.keys) {
        var valor = horasMap[horaKey];
        print('Hora: $horaKey, Valor: $valor');
        if (valor != '') {
          String? diaIngles = '';
          
          Map<String, String> dias = {
            'Lunes': 'Monday',
            'Martes': 'Tuesday',
            'Miercoles': 'Wednesday',
            'Jueves': 'Thursday',
            'Viernes': 'Friday',
            'Sabado': 'Saturday',
            'Domingo': 'Sunday',
          };

          diaIngles = dias[key];

          int horaInt = int.parse(horaKey);
          var horaFormat = horaInt > 999 ? horaKey[0] + horaKey[1] : horaKey[0];
          var input = '$diaIngles $horaFormat';
          print(input);
          List<String> parts = input.split(' ');
          String dayName = parts[0];
          int hours = int.parse(parts[1]);
          DateTime now = DateTime.now();
          int daysToAdd = _getDaysToAdd(dayName, now.weekday);

          DateTime fecha =
              DateTime(now.year, now.month, now.day + daysToAdd, hours, 0, 0);
          print(fecha);
          DateTime to = fecha.add(const Duration(minutes: 30));
          meetings.add(Meeting("Ocupado", fecha, to, Colors.blue, false));
        }
      }
    }
    return meetings;
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

int _getDaysToAdd(String dayName, int currentDayOfWeek) {
  int targetDayOfWeek = _getDayOfWeekNumber(dayName.toLowerCase());
  int daysToAdd = targetDayOfWeek - currentDayOfWeek;
  if (daysToAdd <= 0) {
    daysToAdd += 7;
  }
  return daysToAdd;
}

int _getDayOfWeekNumber(String dayName) {
  switch (dayName) {
    case 'monday':
      return DateTime.monday;
    case 'tuesday':
      return DateTime.tuesday;
    case 'wednesday':
      return DateTime.wednesday;
    case 'thursday':
      return DateTime.thursday;
    case 'friday':
      return DateTime.friday;
    case 'saturday':
      return DateTime.saturday;
    case 'sunday':
      return DateTime.sunday;
    default:
      return 0;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
