import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App-2',
      home: Scaffold(
        appBar: AppBar(
          title: Text('New Login App'),
        ),
        body: LogInScreen(),
      ),
    );
  }
  
}