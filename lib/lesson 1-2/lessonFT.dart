import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
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
  String _htmlText = '';
  String titleBody = '';
  final _controller = TextEditingController();

  Future<void> _loadHtmlPage(elem) async {
    final result = await http.get(Uri.parse('${elem}'));
    setState(() {
      _htmlText = result.body;
      print('${result}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Build apps for any screen',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text(
                    'CORS Header:None',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(_htmlText),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 30,
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          controller: _controller,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      ElevatedButton(
                          onPressed: () {
                            _loadHtmlPage(_controller.text);
                          },
                          child: Text('LOAD')),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  kIsWeb
                      ? Container(
                          child: Text(
                              'APPLICATION RUNNING ON WEB'),
                        )
                      : Container(
                          child: Text(
                              'APPLICATION RUNNING ON ${Platform.operatingSystem}'),
                        )
                ],
              ))
        ],
      ),
    );
  }
}
