import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../widgets/custom_navigation_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
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
                  crossAxisAlignment: CrossAxisAlignment.start, // Alineado a la izquierda
                  mainAxisAlignment: MainAxisAlignment.center, // Centrado verticalmente
                  children: [
                    // Nombre grande con colores del tema de educación
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Jonathan Fabian ', // Nombre y primer apellido
                            style: TextStyle(
                              fontSize: 48, // Tamaño grande
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent, // Color uniforme con Educación
                            ),
                          ),
                          TextSpan(
                            text: 'Paez Torres', // Segundo apellido
                            style: TextStyle(
                              fontSize: 48, // Tamaño grande
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Blanco para contraste
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16), // Espaciado entre nombre y texto animado
                    // Texto animado letra por letra con tema unificado
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Desarrollador de software',
                          textStyle: TextStyle(
                            fontSize: 24, // Tamaño del texto
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent, // Color azul claro
                          ),
                          speed: Duration(milliseconds: 100), // Velocidad de las letras
                        ),
                      ],
                      repeatForever: true, // Repetición infinita
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
