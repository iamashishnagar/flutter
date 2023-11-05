import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/view_file.dart';
import 'second_page.dart';
import 'custom_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('LUNA'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: CustomScaffold(
          // Use CustomScaffold for the menu drawer content
          appBar: AppBar(
            elevation: 0.0,
            title: const Text('Menu'),
          ),
          body: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('FAQs'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _openFilePicker(context);
              },
              child: const Text('Choose File'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openFilePicker(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, // Specify the file type
        allowedExtensions: ['ppt', 'pptx'], // Allowed extensions (ppt/pptx)
      );

      if (result != null) {
        String filePath = result.files.single.path!;
        if (kDebugMode) {
          // Handle the selected file (filePath) as needed
          print('Selected file path: $filePath');
        }
        // Navigate to the PowerPoint viewer page
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PowerFileViewPage(
              downloadUrl: filePath,
              downloadPath: filePath, // You can specify a local path if needed
            ),
          ),
        );
      } else {
        // User canceled the file picker
        if (kDebugMode) {
          print('File picker canceled');
        }
      }
    } catch (e) {
      // Handle any exceptions that may occur
      if (kDebugMode) {
        print('Error selecting file: $e');
      }
    }
  }
}
