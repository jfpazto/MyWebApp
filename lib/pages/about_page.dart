import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';
import 'dart:async';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<String> messages = [];
  int messageIndex = 0;
  bool isTyping = false;
  bool showContactButton = false;

  final List<String> chatMessages = [
    "👋 ¡Hola! Soy Jonathan Páez.",
    "💻 Ingeniero de Sistemas con más de cuatro años de experiencia en ingeniería de datos, ciberseguridad y desarrollo de software.",
    "🚀 Actualmente me desempeño como Ingeniero de Datos, diseñando y optimizando arquitecturas para el procesamiento masivo de datos.",
    "🎨 Experiencia en el desarrollo e implementación de pipelines de datos, integración de fuentes estructuradas y no estructuradas, y el uso de tecnologías Big Data como Hadoop, Spark y SQL.",
    "📡 Apasionado por el análisis de datos, inteligencia artificial y ciberseguridad, con experiencia en la aplicación de técnicas OSINT para la obtención y análisis de información en fuentes abiertas. Habilidad en la ejecución de pruebas de penetración (Pentesting) en entornos Linux y Windows, siguiendo lineamientos de OWASP y MITRE ATT&CK.",
    "🔥 Busco constantemente oportunidades para fusionar mis conocimientos en ingeniería de datos, inteligencia artificial y ciberseguridad, con el fin de aportar valor en la toma de decisiones estratégicas y en la protección de infraestructuras críticas.",
    "🤝 Me gusta colaborar en proyectos que impactan positivamente."
  ];

  @override
  void initState() {
    super.initState();
    _startChatAnimation();
  }

  void _startChatAnimation() {
    Future.delayed(Duration(milliseconds: 1200), _showNextMessage);
  }

  void _showNextMessage() {
    if (messageIndex < chatMessages.length) {
      setState(() {
        isTyping = true;
      });

      Future.delayed(Duration(milliseconds: 1200), () {
        setState(() {
          messages.add(chatMessages[messageIndex]);
          messageIndex++;
          isTyping = false;
        });

        Future.delayed(Duration(milliseconds: 500), _showNextMessage);
      });
    } else {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          showContactButton = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      drawer: isMobile ? CustomNavigationDrawer() : null,
      body: Builder( // 🔥 SOLUCIÓN: Builder proporciona el contexto adecuado para Scaffold
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // **Encabezado con el botón de menú**
                      Row(
                        children: [
                          if (isMobile)
                            IconButton(
                              icon: Icon(Icons.menu, color: Colors.lightBlueAccent, size: 30),
                              onPressed: () {
                                Scaffold.of(context).openDrawer(); // 🔥 Ahora esto funcionará
                              },
                            ),
                          Text(
                            'Sobre mí',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),

                      Divider(color: Colors.lightBlueAccent.withOpacity(0.5), thickness: 1),
                      SizedBox(height: 16),

                      // **Burbujas de chat**
                      Expanded(
                        child: ListView(
                          children: [
                            ...messages.map((msg) => _buildChatBubble(msg)).toList(),
                            if (isTyping) _buildTypingIndicator(),
                          ],
                        ),
                      ),

                      SizedBox(height: 24),

                      // **Botón de contacto con animación de rebote**
                      if (showContactButton)
                        AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.elasticOut,
                          transform: Matrix4.translationValues(0, showContactButton ? 0 : 20, 0),
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/contact');
                              },
                              icon: Icon(Icons.email, size: 24, color: Colors.white),
                              label: Text(
                                "Contáctame 📩",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Método para construir burbujas de chat**
  Widget _buildChatBubble(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // **Método para el indicador de "escribiendo..."**
  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _animatedDot(0),
              SizedBox(width: 4),
              _animatedDot(200),
              SizedBox(width: 4),
              _animatedDot(400),
            ],
          ),
        ),
      ),
    );
  }

  // **Método para animar los puntos del indicador de escritura**
  Widget _animatedDot(int delay) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1000),
      tween: Tween(begin: 0, end: 1),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: (value < 0.5) ? 0.3 : 1,
          child: child,
        );
      },
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
