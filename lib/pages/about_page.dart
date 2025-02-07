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

  final List<Map<String, dynamic>> chatMessages = [
    {"text": "👋 ¡Hola! Soy Jonathan Páez.", "icon": Icons.person, "color": Colors.orange},
    {"text": "💻 Desarrollador de software con pasión por la innovación.", "icon": Icons.code, "color": Colors.blueAccent},
    {"text": "🚀 Me encanta crear experiencias digitales con Flutter y Backend.", "icon": Icons.rocket_launch, "color": Colors.redAccent},
    {"text": "🎨 Diseño interfaces atractivas y funcionales.", "icon": Icons.palette, "color": Colors.purpleAccent},
    {"text": "📡 Experiencia en desarrollo móvil, web y cloud computing.", "icon": Icons.cloud, "color": Colors.teal},
    {"text": "🔥 Aprendiendo y mejorando cada día en nuevas tecnologías.", "icon": Icons.auto_graph, "color": Colors.amber},
    {"text": "🤝 Me gusta colaborar en proyectos que impactan positivamente.", "icon": Icons.handshake, "color": Colors.green},
    {"text": "📩 ¡Hablemos sobre cómo puedo ayudarte!", "icon": Icons.message, "color": Colors.cyan},
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
          messages.add(chatMessages[messageIndex]["text"]);
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
      drawer: isMobile ? CustomNavigationDrawer() : null,
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
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 32, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📌 Título fijo
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Sobre mí',
                        style: TextStyle(
                          fontSize: isMobile ? 28 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    Divider(color: Colors.lightBlueAccent.withOpacity(0.5), thickness: 1),
                    SizedBox(height: 16),

                    // 📌 Contenedor de burbujas de chat
                    Expanded(
                      child: ListView(
                        children: [
                          ...messages.asMap().entries.map((entry) {
                            return _buildChatBubble(
                              entry.value,
                              chatMessages[entry.key]["icon"],
                              chatMessages[entry.key]["color"],
                              isMobile,
                            );
                          }).toList(),
                          if (isTyping) _buildTypingIndicator(),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),

                    // 📌 Botón de contacto con animación de rebote
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
                              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24, vertical: 12),
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

  // 📌 Método para construir burbujas de chat con icono de color
  Widget _buildChatBubble(String text, IconData icon, Color iconColor, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: isMobile ? 10 : 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24), // Icono de color
            SizedBox(width: 8),
            Flexible(
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? 280 : 450),
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
                  style: TextStyle(fontSize: isMobile ? 14 : 16, color: Colors.white),
                ),
              ),
            ),
          ],
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
