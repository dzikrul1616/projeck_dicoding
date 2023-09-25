import 'dart:math';

import 'package:flutter/material.dart';

class UtamaView extends StatefulWidget {
  const UtamaView({super.key});

  @override
  State<UtamaView> createState() => _UtamaViewState();
}

class _UtamaViewState extends State<UtamaView> {
  int randomNumber = 0;

  void generateRandomNumber() {
    final random = Random();
    setState(() {
      randomNumber = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.amberAccent[200],
        centerTitle: true,
        title: Text(
          "Utama",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nomor Acak:",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "$randomNumber",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateRandomNumber,
              child: Text("Generate Nomor Acak"),
            ),
          ],
        ),
      ),
    );
  }
}
