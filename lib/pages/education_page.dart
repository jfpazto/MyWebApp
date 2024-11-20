import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';
class EducationPage extends StatelessWidget {
  final List<Map<String, String>> educationData = [
    {
      'title': 'MET [Mujeres en Tecnología]',
      'subtitle': 'Metcamp Web, Desarrollo Web con React',
      'details': 'Curso de 30 horas.',
      'date': 'Agosto 2022 - Septiembre 2022',
      'certificate': 'Certificado'
    },
    {
      'title': 'Programa ONE de Oracle - Alura Latam',
      'subtitle': 'Principiante en Programación G3 ONE',
      'details': 'Curso de 75 horas.',
      'date': 'Agosto 2022 - Agosto 2022',
      'certificate': 'Certificado'
    },
    // Más datos de educación aquí...
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
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: educationData.length,
              itemBuilder: (context, index) {
                final item = educationData[index];
                return Card(
                  color: Color(0xFF292A40),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['subtitle']!,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['details']!,
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        if (item['certificate']!.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(top: 8.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              item['certificate']!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        if (item['date']!.isNotEmpty)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              item['date']!,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
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
