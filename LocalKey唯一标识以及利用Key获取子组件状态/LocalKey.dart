import 'package:flutter/material.dart';
import 'dart:async';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> list = [
    // 同一类型组件要进行区分，就必须用到key
    // ValueKey、UniqueKey、ObjectKey都属于局部Key
    Box(
      key: ValueKey("0"), // ValueKey内可以随意写，只要互相不重复就行
      color: Colors.red,
    ),
    Box(
      key: UniqueKey(), // UniqueKey是自动生成，是唯一的值，每次运行随机生成
      color: Colors.yellow,
    ),
    Box(
      key: ObjectKey(Box(
        color: Colors.blue,
      )), // ObjectKey传入对象
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.shuffle(); // 打乱list元素顺序
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;
  int count;
  Box(
      {super.key,
      this.color = Colors.white,
      this.count = 0}); // super.key表示把key传给父类

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(widget.color),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.red),
          )),
        ),
        onPressed: () {
          setState(() {
            widget.count++;
          });
        },
        child: Text(
          "${widget.count}",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
