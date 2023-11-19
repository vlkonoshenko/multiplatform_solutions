import 'package:flutter/material.dart';
import 'package:multiplatform_solution/screens/adaptive_screen.dart';
import 'package:multiplatform_solution/screens/webview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          body: Column(children: [
            TextButton(
                onPressed: () => _onWebviewPressed(context),
                child: const Text('WebviewScreen')),
            TextButton(
                onPressed: () => _onAdaptivePressed(context),
                child: const Text('Adaptive')),
          ]),
        );
      }),
    );
  }

  void _onAdaptivePressed(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AdaptiveScreen()));
  }

  void _onWebviewPressed(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const WebviewScreen()));
  }
}
