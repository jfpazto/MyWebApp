import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String details;
  final String date;
  final String certificate;

  SectionCard({
    required this.title,
    required this.subtitle,
    required this.details,
    required this.date,
    required this.certificate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF292A40),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              details,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            if (certificate.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 8.0),
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  certificate,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            if (date.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
