import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multiplatform/lesson%204/data/peoples.dart';
import 'package:multiplatform/lesson%204/ui/desktop_view.dart';
import 'package:multiplatform/lesson%204/ui/phone_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List _peoples = Peoples().peoples;

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return mediaquery.size.width < 720
        ? PhoneView(peoples: _peoples)
        : DesktopView(peoples: _peoples);
  }
}
