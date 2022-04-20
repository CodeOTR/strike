import 'package:flutter/material.dart';
import 'package:strike/strike.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strike API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Strike API Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Strike _strike = Strike(
    apiKey: '<YOUR_API_KEY>',
    debugMode: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _strike.getProfileByHandle(handle: 'joemuller');
              },
              child: const Text('Get user by handle'),
            ),
            ElevatedButton(
              onPressed: () {
                _strike.getInvoices();
              },
              child: const Text('Get invoices'),
            ),

          ],
        ),
      ),
    );
  }
}
