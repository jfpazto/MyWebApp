import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio',
      theme: ThemeData(
        primaryColor: Color(0xFF1E1E2C),
        scaffoldBackgroundColor: Color(0xFF1E1E2C),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white70),
        ),
      ),
      initialRoute: '/home', // Ruta inicial de la aplicación
      routes: {
        '/home': (context) => HomePage(), // Define la ruta '/home'
      },
    );
  }
}
