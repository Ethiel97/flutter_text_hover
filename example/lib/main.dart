import 'package:flutter/material.dart';
import 'package:text_hover/config.dart';
import 'package:text_hover/text_hover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Text Hover',
        theme: ThemeData(
          //primarySwatch: Colors.indigo[400],
          primaryColor: Colors.indigo[400],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(title: 'Text hover demo'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Center(
          child: TextHover(
            text: 'Aesthetic Ethiel',
            config: Config(
              hoverColor: Colors.red,
              textColor: Colors.black,
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
