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
    List<int> text = [1, 2, 3, 4];
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: <Widget>[
            for (var i in text)
              (ListTile(
                title: Text(i.toString() + " my name joe mama"),
              )),
          ],
        ),
      ),
    );
  }
}
