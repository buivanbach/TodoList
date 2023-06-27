import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Model/tasks.dart';
import 'package:todo_list/screens/home_page.dart';
import 'package:todo_list/screens/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TodoList',
        theme: ThemeData(
            accentColor: Colors.blueAccent,
            fontFamily: 'Lato'),
        home: Splash(),
      )
    );

  }
}
