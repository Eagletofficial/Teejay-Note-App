import 'package:flutter/material.dart';
import 'package:teejay_note_app/calender.dart';
import 'package:teejay_note_app/screen.dart/notebody.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(primaryColor: Colors.red),
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const NoteBody(),
    );
  }
}
