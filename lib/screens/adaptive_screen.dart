import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdaptiveScreen extends StatefulWidget {
  const AdaptiveScreen({super.key});

  @override
  State<AdaptiveScreen> createState() => _AdaptiveScreenState();
}

class _AdaptiveScreenState extends State<AdaptiveScreen> {
  String _htmlText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_htmlText),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadHtmlPage,
        tooltip: 'Increment',
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }

  Future<void> loadHtmlPage() async {
    final result = await http.get(Uri.parse('https://flutter.dev'));
    setState(() {
      _htmlText = result.body;
    });
  }
}
