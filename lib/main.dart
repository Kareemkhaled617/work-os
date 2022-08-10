import 'package:flutter/material.dart';
import 'package:work_os/screens/auth/login.dart';
import 'package:work_os/screens/task.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work Os',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEDE7DC),
        primarySwatch: Colors.blue,
      ),
      home:   TasksScreen(),
    );
  }
}


