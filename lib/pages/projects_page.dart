import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';
class ProjectsPage extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Proyecto 1',
      'description': 'Una aplicación móvil para gestionar tareas.',
      'image': 'assets/project1.png',
    },
    {
      'title': 'Proyecto 2',
      'description': 'Un sitio web interactivo para ventas.',
      'image': 'assets/project2.png',
    },
    // Agrega más proyectos aquí...
  ];

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
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de columnas
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 2,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Card(
                  color: Color(0xFF292A40),
                  child: Column(
                    children: [
                      Image.asset(project['image']!, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          project['title']!,
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        project['description']!,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
