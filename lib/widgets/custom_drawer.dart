import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Encabezado con avatar interactivo
            UserAccountsDrawerHeader(
              accountName: Text("Jonathan"),
              accountEmail: Text("jfpazto@gmail.com"),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  // Acción al hacer clic en el avatar
                  print("Perfil seleccionado");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.blue),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            // Lista de opciones con animaciones
            Expanded(
              child: ListView(
                children: [
                  _buildNavItem(Icons.home, "Inicio", context, '/home'),
                  _buildNavItem(Icons.school, "Educación", context, '/education'),
                  _buildNavItem(Icons.work, "Proyectos", context, '/projects'),
                  _buildNavItem(Icons.contact_mail, "Contacto", context, '/contact'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, BuildContext context, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 26),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
