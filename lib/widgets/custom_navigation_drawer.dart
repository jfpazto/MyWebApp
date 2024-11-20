import 'package:flutter/material.dart';
import 'package:my_website/pages/home.dart';
import '../pages/about_page.dart';
import '../pages/education_page.dart';
import '../pages/projects_page.dart';
import '../pages/contact_page.dart';

class CustomNavigationDrawer extends StatefulWidget {
  @override
  _CustomNavigationDrawerState createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  // Índice del enlace seleccionado
  int _selectedIndex = 0;

  // Índice del enlace que está siendo "hovered"
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF292A40),
      child: Column(
        children: [
          // Encabezado con avatar
          Container(
            padding: EdgeInsets.symmetric(vertical: 32), // Espaciado vertical
            child: Column(
              children: [
                Container(
                  width: 90 * 2, // Tamaño del círculo
                  height: 90 * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Borde blanco
                      width: 4,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Icon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16), // Espaciado debajo del avatar
              ],
            ),
          ),
          // Opciones de navegación en la parte inferior
          Column(
            children: [
              _buildNavItem('Jonathan', 0, context, HomePage()),
              _buildNavItem('Sobre mí', 1, context, AboutPage()),
              _buildNavItem('Educación', 2, context, EducationPage()),
              _buildNavItem('Proyectos', 3, context, ProjectsPage()),
              _buildNavItem('Contacto', 4, context, ContactPage()),
            ],
          ),
          // Espaciado para colocar la línea más abajo
          SizedBox(height: 80), // Ajusta este valor para aumentar o reducir la separación
          // Línea con gradiente animado que ocupa todo el ancho
          AnimatedGradientLine(), // Aquí añadimos la línea animada
        ],
      ),
    );
  }

  // Widget para un enlace de navegación
  Widget _buildNavItem(String title, int index, BuildContext context, Widget page) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredIndex = index; // Marca este índice como "hovered"
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredIndex = null; // Limpia el índice "hovered"
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16), // Espaciado vertical
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: _selectedIndex == index
                    ? Colors.white // Color cuando está seleccionado
                    : _hoveredIndex == index
                        ? Colors.blueAccent // Color cuando el cursor pasa por encima
                        : Colors.grey, // Color por defecto
                fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                fontSize: 16, // Tamaño de letra
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Línea con gradiente animado
class AnimatedGradientLine extends StatefulWidget {
  @override
  _AnimatedGradientLineState createState() => _AnimatedGradientLineState();
}

class _AnimatedGradientLineState extends State<AnimatedGradientLine> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: 8, // Altura de la línea
          width: double.infinity, // Ocupa todo el ancho disponible
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.purpleAccent,
                Colors.blueAccent,
              ],
              stops: [
                _controller.value,
                _controller.value + 0.2,
                _controller.value + 0.4,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        );
      },
    );
  }
}
