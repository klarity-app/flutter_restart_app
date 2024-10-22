import 'package:flutter/material.dart';
import 'package:flutter_restart_app/flutter_restart_app.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_restart_app quickstart')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => FlutterRestartApp.instance.now(),
                child: const Text('Restart App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
