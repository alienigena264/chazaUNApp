import 'package:chazaunapp/view/login_vista.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginVista(),
        //'/Otra':(context) => const OtherPage(),
        //'/Services':(context) => const ServicesPage(),
      },
    );
  }
}