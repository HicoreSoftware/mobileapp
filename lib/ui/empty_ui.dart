import 'package:flutter/material.dart';

class EmptyUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Empty UI")),
      body: Center(
        child: Text(
          "No content available.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
