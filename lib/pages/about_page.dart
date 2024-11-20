import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Barra de navegación fija
          SizedBox(
            width: 250,
            child: CustomNavigationDrawer(),
          ),
          // Contenido principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre mí',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Soy un desarrollador apasionado por la tecnología, con experiencia en Flutter, diseño UI/UX, y desarrollo backend. Me encanta crear soluciones creativas que combinan funcionalidad y diseño.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
