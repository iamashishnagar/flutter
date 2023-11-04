import 'package:flutter/material.dart';
import 'custom_scaffold.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('LUNA'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const <Widget>[
          // Add any actions specific to the SecondPage here if needed.
        ],
      ),
      body: const Center(
        child: Text(
          'Luna mHealth Content Here...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
