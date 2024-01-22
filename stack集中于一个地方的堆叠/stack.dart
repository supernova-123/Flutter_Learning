import 'package:flutter/material.dart';
// ignore: slash_for_doc_comments
/**
 * 层叠布局：Stack、Align、Positioned
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello I am here"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black12,
      body: MyStack(),
    );
  }
}

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // 子元素的显示位置
      children: [
        Container(
          height: 400,
          width: 300,
          color: Colors.red,
        ),
        Text("Damn am I here? WOW I am blocked!"), // 这个东西没有和Container隔开，堆叠到Container里面了
        Container( // 这个会把上面的文字遮住（后面的块会把前面的盖住）
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
        Positioned( // 这个widget作用的容器可以指定在stack内的位置
          left: 50,
          bottom: 30,
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Text("呃呃"),
          ),          
        ),
        Text("你好Flutter!"),
      ],
    );
  }
}