import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/custom_navigation_drawer.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<Map<String, dynamic>> messages = [
    {"text": "¡Hola! Soy Jonathan, un apasionado del desarrollo de software.", "icon": Icons.waving_hand, "color": Colors.yellow},
    {"text": "Me encanta crear soluciones innovadoras con Flutter y Backend.", "icon": Icons.code, "color": Colors.blueAccent},
    {"text": "También disfruto el diseño UI/UX, buscando siempre la mejor experiencia.", "icon": Icons.palette, "color": Colors.purpleAccent},
    {"text": "Me interesa el análisis de datos y la inteligencia artificial.", "icon": Icons.trending_up, "color": Colors.greenAccent},
    {"text": "Siempre estoy aprendiendo nuevas tecnologías y optimizando mi código.", "icon": Icons.lightbulb, "color": Colors.orangeAccent},
    {"text": "¿Quieres conocer más? ¡No dudes en contactarme!", "icon": Icons.chat, "color": Colors.pinkAccent}
  ];

  int currentMessageIndex = 0;
  List<Map<String, dynamic>> displayedMessages = [];
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    _startChatAnimation();
  }

  void _startChatAnimation() {
    Timer.periodic(Duration(milliseconds: 1700), (timer) {
      if (currentMessageIndex < messages.length) {
        setState(() {
          isTyping = true;
        });

        Future.delayed(Duration(milliseconds: 1200), () {
          setState(() {
            displayedMessages.add(messages[currentMessageIndex]);
            currentMessageIndex++;
            isTyping = false;
          });
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 📌 Barra de navegación fija
          SizedBox(
            width: 250,
            child: CustomNavigationDrawer(),
          ),
          // 📌 Contenido principal
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📌 Título fijo con icono
                    Row(
                      children: [
                        Icon(Icons.person, size: 40, color: Colors.lightBlueAccent),
                        SizedBox(width: 10),
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

                    // 📌 Contenedor del chat
                    Expanded(
                      child: ListView(
                        children: [
                          ...displayedMessages.map((msg) => _buildChatBubble(msg)),
                          if (isTyping) _buildTypingIndicator(), // Indicador de "escribiendo..."
                        ],
                      ),
                    ),

                    SizedBox(height: 24),

                    // 📌 Botón "Contáctame" con animación
                    Center(
                      child: TweenAnimationBuilder<double>(
                        duration: Duration(seconds: 1),
                        tween: Tween(begin: 0.8, end: 1.0),
                        curve: Curves.easeInOut,
                        builder: (context, scale, child) {
                          return Transform.scale(scale: scale, child: child);
                        },
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.contact_mail, color: Colors.white),
                          label: Text("Contáctame"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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

  // 🟢 Widget para las burbujas de chat con iconos coloridos
  Widget _buildChatBubble(Map<String, dynamic> message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(message["icon"], color: message["color"], size: 24), // 🎨 Ícono con color
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  message["text"],
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🟡 Widget para el indicador de "escribiendo..."
  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDot(),
              SizedBox(width: 4),
              _buildDot(delay: 300),
              SizedBox(width: 4),
              _buildDot(delay: 600),
            ],
          ),
        ),
      ),
    );
  }

  // 🔵 Pequeño widget para los puntos animados del indicador de "escribiendo..."
  Widget _buildDot({int delay = 0}) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1200), // ⏳ Más duración
      tween: Tween(begin: 0.3, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, opacity, child) {
        return Opacity(opacity: opacity, child: child);
      },
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      onEnd: () {
        Future.delayed(Duration(milliseconds: delay), () {
          setState(() {});
        });
      },
    );
  }
}
