import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();
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
                            'Proyectos',
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
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '🚀 Mis Proyectos',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                            ),
                            SizedBox(height: 20),
                            _buildAnimatedProjectList(),
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

  Widget _buildAnimatedProjectList() {
    final List<ProjectItem> projectItems = [
      ProjectItem(
        title: 'Gestor de Tareas',
        description: 'Aplicación para organizar y gestionar tareas diarias.',
        imageUrl: 'assets/project1.png',
        icon: Icons.task,
      ),
      ProjectItem(
        title: 'E-commerce Web',
        description: 'Tienda online con pagos integrados.',
        imageUrl: 'assets/project2.png',
        icon: Icons.shopping_cart,
      ),
    ];

    return Column(
      children: List.generate(projectItems.length, (index) {
        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 800 + (index * 200)),
          tween: Tween(begin: 0, end: 1),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 20),
                child: child,
              ),
            );
          },
          child: projectItems[index],
        );
      }),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final IconData icon;

  const ProjectItem({
    required this.title,
    required this.description,
    required this.imageUrl,
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
              description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
