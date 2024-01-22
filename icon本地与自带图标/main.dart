import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello ICON!")),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // 加载flutter内置图标
        SizedBox(height: 20,),
        Icon(Icons.home,size: 40,color: Colors.redAccent,),
        SizedBox(height: 20,),
        Icon(Icons.settings,size: 40,color: Colors.black54,),
        SizedBox(height: 20,),
        Icon(Icons.search,size: 40,color: Colors.black54,),
        Icon(Icons.search_off,size: 40,color: Colors.black54,),
        Icon(Icons.search_sharp,size: 40,color: Colors.black54,),
        SizedBox(height: 20,),
        Icon(Icons.person,size: 40,color: Colors.black54,),
        
      ],
    );
  }
}