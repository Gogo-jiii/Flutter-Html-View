import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String viewID = "your-view-id";

  Widget adsenseAdsView() {
    ui.platformViewRegistry.registerViewFactory(
        viewID,
            (int id) => html.IFrameElement()
          ..style.width = '100%'
          ..style.height = '100%'
          ..srcdoc = '''
          <!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>
          '''
              ..style.border = 'none');


    return  SizedBox(
      height: 300.0,
      width: 320.0,
      child: HtmlElementView(
        viewType: viewID,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: adsenseAdsView()),
    );
  }
}