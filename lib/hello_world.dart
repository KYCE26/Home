import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halo'),
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
