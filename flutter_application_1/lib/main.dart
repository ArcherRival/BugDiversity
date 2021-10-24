import 'package:flutter/material.dart';
import 'package:flutter_application_1/camera_page.dart';
import 'main_page.dart';
import 'package:firebase_core/firebase_core.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // Create the initialization Future outside of build:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call initializeApp
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: Text("Someting went Worng"));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(home: MainPage());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
