// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'dart:async';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey _globalKey2 = GlobalKey();
  final GlobalKey _globalKey3 = GlobalKey();
  List<Widget> list = [];
  @override
  void initState() {
    super.initState();
    list = [
      Box(
        key: _globalKey1,
        color: Colors.red,
      ),
      Box(
        key: _globalKey2,
        color: Colors.yellow,
      ),
      Box(
        key: _globalKey3,
        color: Colors.blue,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(MediaQuery.of(context).orientation);
    } // 获取屏幕旋转方向
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        // 在Row和Column之间切换时如果使用局部的key，那么状态不会保存（不同的组件）
        // 这时候考虑使用global key
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                // 竖屏时为Column
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              )
            : Row(
                // 横屏时为Row
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
        child: const Icon(Icons.refresh),
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
            side: const BorderSide(color: Colors.red),
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
