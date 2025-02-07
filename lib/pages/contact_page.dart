import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      drawer: isMobile ? CustomNavigationDrawer() : null,
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
                          Text(
                            'Contacto',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.lightBlueAccent.withOpacity(0.5), thickness: 1),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📞 Información de Contacto',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                            ),
                            SizedBox(height: 20),
                            _buildContactItem(Icons.email, 'Email', 'email@example.com'),
                            _buildContactItem(Icons.phone, 'Teléfono', '+123 456 7890'),
                            _buildContactItem(Icons.web, 'Sitio Web', 'www.miportafolio.com'),
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

  Widget _buildContactItem(IconData icon, String title, String info) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white.withOpacity(0.9),
      child: ListTile(
        leading: Icon(icon, color: Colors.lightBlueAccent, size: 30),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
        ),
        subtitle: Text(
          info,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
