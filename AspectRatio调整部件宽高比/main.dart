import 'package:flutter/material.dart';
// 调整子元素的宽高比
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Damn what's going on?"),
          backgroundColor: Colors.amber,
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio( // 宽度是屏幕宽度，高度是容器高度的一半
      aspectRatio: 2/1,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}