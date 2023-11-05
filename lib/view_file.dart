import 'package:flutter/material.dart';
import 'package:power_file_view/power_file_view.dart';

class PowerFileViewPage extends StatelessWidget {
  final String downloadUrl;
  final String downloadPath;

  const PowerFileViewPage({
    Key? key,
    required this.downloadUrl,
    required this.downloadPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PowerPoint Viewer'),
      ),
      body: PowerFileViewWidget(
        downloadUrl: downloadUrl,
        filePath: downloadPath,
      ),
    );
  }
}
