import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
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
            UserAccountsDrawerHeader(
              accountName: Text(
                "Jonathan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              accountEmail: Text(
                "jfpazto@gmail.com",
                style: TextStyle(color: Colors.grey[300]),
              ),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  print("Perfil seleccionado");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Icon(Icons.person, size: 50, color: Colors.blueAccent),
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
    return MouseRegion(
      onEnter: (_) {
        // Resaltar opción al pasar el mouse
      },
      onExit: (_) {
        // Restaurar color original
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade800.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.blueAccent, size: 26),
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
      ),
    );
  }
}
