import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';

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

    // ✨ Animación para el destello en la AppBar
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
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      drawer: isMobile ? CustomNavigationDrawer() : null, // Drawer solo en móviles
      body: Builder(
        builder: (context) => Row(
          children: [
            if (!isMobile) SizedBox(width: 250, child: CustomNavigationDrawer()),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B1E2F), Color(0xFF2A2D3E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    // **Encabezado con botón de menú**
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: Row(
                        children: [
                          if (isMobile)
                            IconButton(
                              icon: Icon(Icons.menu, color: Colors.lightBlueAccent, size: 30),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            ),
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.white.withOpacity(0.3),
                                  Colors.white.withOpacity(0.9),
                                  Colors.white.withOpacity(0.3),
                                ],
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Educación',
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(color: Colors.lightBlueAccent.withOpacity(0.5), thickness: 1),

                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '🎓 Mi Educación',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
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

// 📌 Componente para cada ítem de educación
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
                Icon(icon, size: 30, color: Colors.lightBlueAccent),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
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
