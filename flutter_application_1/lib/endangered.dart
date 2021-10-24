import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class Endangered extends StatefulWidget {
  const Endangered({Key? key}) : super(key: key);

  @override
  _Endangered createState() => _Endangered();
}

class _Endangered extends State<Endangered> {
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}*/

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
