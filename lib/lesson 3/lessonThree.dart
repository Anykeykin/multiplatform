import 'dart:io';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiplatform/lesson%203/web_platform_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  String _htmlText = 'https://flutter.dev/';
  String titleBody = '';
  final _controller = TextEditingController();

  

  Future<void> _loadHtmlPage(elem) async {
    final result = await http.get(Uri.parse('${elem}'));
    BeautifulSoup bs = BeautifulSoup(result.body);
    setState(() {
      titleBody = bs.h1!.text;
      _htmlText = result.body;
      print('${result}');
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadHtmlPage('https://flutter.dev/');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$titleBody',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text(
                          'CORS Header:None',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 6,
                //   child: kIsWeb
                //       ? HyperLink(
                //           link: _htmlText,
                //         )
                //       : Platform.operatingSystem == 'android' ||
                //               Platform.operatingSystem == 'ios'
                //           ? WebView(
                //               initialUrl: _htmlText,
                //             )
                //           : HyperLink(
                //               link: _htmlText,
                //             ),
                // ),
                Expanded(
                  flex: 6,
                  child: kIsWeb
                      ? Text('hello')
                      : Platform.operatingSystem == 'android' ||
                              Platform.operatingSystem == 'ios'
                          ? WebView(
                              initialUrl: _htmlText,
                            )
                          : Text('hello')
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 30,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
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
                                child: Text('APPLICATION RUNNING ON WEB'),
                              )
                            : Container(
                                child: Text(
                                    'APPLICATION RUNNING ON ${Platform.operatingSystem}'),
                              )
                      ],
                    ))
              ],
            );
          }),
    );
  }
}

// class HyperLink extends StatelessWidget {
//   final String link;
//
//   const HyperLink({super.key, required this.link});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//       },
//       child: WebPlatformView(
//        link: '$link',
//       ),
//     );
//   }
// }
