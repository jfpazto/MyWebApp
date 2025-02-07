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
  int _selectedIndex = 0;
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Encabezado con avatar
          Container(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Container(
                  width: 120, // Tamaño del círculo
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.8), // Borde blanco translúcido
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/Icon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Jonathan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Opciones de navegación en la parte inferior
          Column(
            children: [
              _buildNavItem('Sobre mí', Icons.person, 1, context, AboutPage()),
              _buildNavItem('Educación', Icons.school, 2, context, EducationPage()),
              _buildNavItem('Proyectos', Icons.work, 3, context, ProjectsPage()),
              _buildNavItem('Contacto', Icons.contact_mail, 4, context, ContactPage()),
            ],
          ),
          Spacer(),
          // Línea con gradiente animado
          AnimatedGradientLine(),
        ],
      ),
    );
  }

  // Widget para un enlace de navegación con icono
  Widget _buildNavItem(String title, IconData icon, int index, BuildContext context, Widget page) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredIndex = null;
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Colors.blueAccent.withOpacity(0.3)
                : _hoveredIndex == index
                    ? Colors.blueAccent.withOpacity(0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.grey[400],
                  fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
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
          height: 8,
          width: double.infinity,
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
