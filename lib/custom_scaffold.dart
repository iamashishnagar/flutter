import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget? drawer; // Make drawer optional
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.appBar,
    this.drawer, // Make drawer optional
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer, // Use the provided drawer if it's not null
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(200, 196, 255, 1),
              Color.fromRGBO(153, 249, 203, 1)
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}
