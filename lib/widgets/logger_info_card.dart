import 'package:flutter/material.dart';

/// Written by Juan Pablo Gutiérrez
/// 24 - 06 - 2023

class LoggerInfoCard extends StatelessWidget {
  final String infoType;
  const LoggerInfoCard({super.key, required this.infoType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("object"),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width / 1.3,
        padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$infoType",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
