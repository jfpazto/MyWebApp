import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';
class ContactPage extends StatelessWidget {
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
                    'Contacto',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Si deseas contactarme, puedes hacerlo a través de:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.white),
                    title: Text('email@example.com',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.white),
                    title: Text('+123 456 7890',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.web, color: Colors.white),
                    title: Text('www.miportafolio.com',
                        style: TextStyle(color: Colors.white)),
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
