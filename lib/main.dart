import 'package:flutter/material.dart';
import 'package:timer/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  const config = FirebaseOptions(
      apiKey: "AIzaSyA5zCsKzRsmJoFwWW0XJ_oUTOPe9ZQRKTM",
      appId: "1:388890135059:web:17df6f5af959cbadd04de6",
      messagingSenderId: "388890135059",
      projectId: "test-22f99"
  );


  await Firebase.initializeApp(options: config);
  runApp(const MyApp());

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Multi-Timer',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const LoginScreen(),
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = ['Groupe 1 ', 'Groupe 2','Groupe 3','Groupe 4','Groupe 5'];
  String? value;

  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(360),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 4),
          ),
        child: DropdownButton<String>(
          value: value,
          iconSize: 36,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          isExpanded: true,
          items: items.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() => this.value = value),
        ),
      ),
    ));

    // ignore: dead_code
    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }


