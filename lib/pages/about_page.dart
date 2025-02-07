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
    "💻 Desarrollador de software con pasión por la innovación.",
    "🚀 Me encanta crear experiencias digitales con Flutter y Backend.",
    "🎨 Diseño interfaces atractivas y funcionales.",
    "📡 Experiencia en desarrollo móvil, web y cloud computing.",
    "🔥 Aprendiendo y mejorando cada día en nuevas tecnologías.",
    "🤝 Me gusta colaborar en proyectos que impactan positivamente.",
    "📩 ¡Hablemos sobre cómo puedo ayudarte!"
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

      Future.delayed(Duration(milliseconds: 1800), () {
        setState(() {
          messages.add(chatMessages[messageIndex]);
          messageIndex++;
          isTyping = false;
        });

        Future.delayed(Duration(milliseconds: 700), _showNextMessage);
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
      drawer: isMobile ? CustomNavigationDrawer() : null, // Drawer solo en móviles
      body: Row(
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
                    // Barra superior con menú en móviles
                    if (isMobile)
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.menu, color: Colors.lightBlueAccent, size: 30),
                            onPressed: () {
                              Scaffold.of(context).openDrawer(); // Abre el Drawer en móviles
                            },
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Sobre mí',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      )
                    else
                      Text(
                        'Sobre mí',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                      ),

                    Divider(color: Colors.lightBlueAccent.withOpacity(0.5), thickness: 1),
                    SizedBox(height: 16),

                    // Contenedor de burbujas de chat
                    Expanded(
                      child: ListView(
                        children: [
                          ...messages.map((msg) => _buildChatBubble(msg)).toList(),
                          if (isTyping) _buildTypingIndicator(),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),

                    // Botón de contacto con animación de rebote
                    if (showContactButton)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(0, showContactButton ? 0 : 20, 0),
                        child: Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Acción del botón
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
    );
  }

  // 📌 Método para construir burbujas de chat
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
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
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

  // 📌 Método para el indicador de "escribiendo..."
  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
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

  // 📌 Método para animar los puntos del indicador de escritura
  Widget _animatedDot(int delay) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1500),
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
