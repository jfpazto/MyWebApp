import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../widgets/custom_navigation_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width < 700 ? CustomNavigationDrawer() : null, // Drawer solo en pantallas pequeñas
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 700; // Detecta si es móvil

            return Row(
              children: [
                // Barra de navegación fija solo en pantallas grandes
                if (!isMobile)
                  SizedBox(
                    width: 250,
                    child: CustomNavigationDrawer(),
                  ),
                // Contenido principal
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Nombre grande con colores del tema de educación
                        RichText(
                          textAlign: TextAlign.center, // Centrado en móviles
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Jonathan Fabian ', // Nombre y primer apellido
                                style: TextStyle(
                                  fontSize: isMobile ? 36 : 48, // Tamaño adaptable
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              TextSpan(
                                text: 'Paez Torres', // Segundo apellido
                                style: TextStyle(
                                  fontSize: isMobile ? 36 : 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                                fontSize: isMobile ? 20 : 24, // Tamaño adaptable
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),
                              speed: Duration(milliseconds: 100),
                            ),
                          ],
                          repeatForever: true,
                        ),
                        SizedBox(height: isMobile ? 20 : 40), // Espaciado dinámico
                        if (isMobile)
                          IconButton(
                            icon: Icon(Icons.menu, color: Colors.white, size: 30),
                            onPressed: () {
                              Scaffold.of(context).openDrawer(); // Abre el menú en móvil
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
