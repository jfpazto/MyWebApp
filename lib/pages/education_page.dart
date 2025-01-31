import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();

    // Animación para el destello de la AppBar
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _shineAnimation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AnimatedBuilder(
          animation: _shineAnimation,
          builder: (context, child) {
            return AppBar(
              title: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.1),
                    ],
                    stops: [(_shineAnimation.value - 0.5).clamp(0.0, 1.0), _shineAnimation.value.clamp(0.0, 1.0), (_shineAnimation.value + 0.5).clamp(0.0, 1.0)],
                  ).createShader(bounds);
                },
                child: Text(
                  'Educación',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: Colors.blueAccent,
              leading: IconButton(
                icon: Icon(Icons.menu, color: Colors.white), // Ícono de menú
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
      ),
      drawer: _buildDrawer(context), // Agregamos el Drawer de navegación
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🎓 Mi Educación',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                EducationItem(
                  title: 'Maestría en Ingeniería de Sistemas',
                  institution: 'Universidad en España',
                  date: '2025 - Presente',
                  details: 'Especialización en análisis de datos y arquitectura de software.',
                  certificateUrl: 'https://certificados.universidad.com/maestria',
                  icon: Icons.school,
                ),
                EducationItem(
                  title: 'Ingeniería de Sistemas',
                  institution: 'Universidad Nacional',
                  date: '2019 - 2024',
                  details: 'Enfoque en desarrollo de software y sistemas distribuidos.',
                  certificateUrl: 'https://certificados.universidad.com/ingenieria',
                  icon: Icons.computer,
                ),
                EducationItem(
                  title: 'Curso de Big Data y Hadoop',
                  institution: 'Platzi',
                  date: '2023',
                  details: 'Conceptos avanzados de Big Data y procesamiento distribuido.',
                  certificateUrl: 'https://platzi.com/cursos/hadoop/',
                  icon: Icons.cloud,
                ),
                EducationItem(
                  title: 'Certificación AWS Certified Solutions Architect',
                  institution: 'Amazon Web Services',
                  date: '2022',
                  details: 'Diseño de arquitecturas en la nube con AWS.',
                  certificateUrl: 'https://aws.amazon.com/certification/',
                  icon: Icons.cloud_done,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, '/home'); // Asegúrate de definir la ruta en main.dart
            },
          ),
          ListTile(
            leading: Icon(Icons.school, color: Colors.blueAccent),
            title: Text('Educación'),
            onTap: () {
              Navigator.pop(context); // Ya estamos en Educación, solo cerramos el menú
            },
          ),
          ListTile(
            leading: Icon(Icons.work, color: Colors.blueAccent),
            title: Text('Proyectos'),
            onTap: () {
              Navigator.pushNamed(context, '/projects'); // Ruta a Proyectos
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail, color: Colors.blueAccent),
            title: Text('Contacto'),
            onTap: () {
              Navigator.pushNamed(context, '/contact'); // Ruta a Contacto
            },
          ),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String title;
  final String institution;
  final String date;
  final String details;
  final String certificateUrl;
  final IconData icon;

  const EducationItem({
    required this.title,
    required this.institution,
    required this.date,
    required this.details,
    required this.certificateUrl,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.blueAccent),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              institution,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blueGrey),
            ),
            SizedBox(height: 4),
            Text(
              date,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 12),
            Text(
              details,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.open_in_new, size: 18),
                label: Text("Ver certificado"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
