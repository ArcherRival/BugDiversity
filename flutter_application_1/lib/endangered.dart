import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Endangered extends StatefulWidget {
  const Endangered({Key? key}) : super(key: key);

  @override
  _EndangeredState createState() => _EndangeredState();
}

class _EndangeredState extends State<Endangered> {
  @override
  Widget build(BuildContext context) {
    const title = 'Endangered';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              title: Text('1. [Placeholder]'),
            ),
            ListTile(
              title: Text('2. [Placeholder]'),
            ),
            ListTile(
              title: Text('3. [Placeholder]'),
            ),
            ListTile(
              title: Text('4. [Placeholder]'),
            ),
            ListTile(
              title: Text('5. [Placeholder]'),
            ),
            ListTile(
              title: Text('6. [Placeholder]'),
            ),
            ListTile(
              title: Text('7. [Placeholder]'),
            ),
            ListTile(
              title: Text('8. [Placeholder]'),
            ),
            ListTile(
              title: Text('9. [Placeholder]'),
            ),
            ListTile(
              title: Text('10. [Placeholder]'),
            ),
          ],
        ),
      ),
    );
  }
}
