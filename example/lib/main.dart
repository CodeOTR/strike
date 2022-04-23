import 'package:example/invoices/invoices.dart';
import 'package:example/invoices/new_invoice.dart';
import 'package:example/users/user_search.dart';
import 'package:flutter/material.dart';
import 'package:strike/strike.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

DotEnv? dotEnv;

Future<void> main()  async {
  await dotenv.load(fileName: '.env');
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
    apiKey: dotenv.env['STRIKE_API_KEY']!,
    debugMode: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Invoices'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Invoices(),));
            },
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserSearch()));
            },
            title: const Text('User Search'),
          ),

        ],
      ),
    );
  }
}
