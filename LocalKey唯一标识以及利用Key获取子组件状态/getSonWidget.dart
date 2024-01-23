// ignore_for_file: must_be_immutable
// 希望在父widget内修改子widget的状态
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
  final GlobalKey _globalKey = GlobalKey();

  List<Widget> list = [];
  @override
  void initState() {
    super.initState();
    list = [
      Box(
        key: _globalKey,
        color: Colors.red,
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
        child: Box(
          key: _globalKey,
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // 注意看这里，让父组件通过globalkey修改子组件
        // 实际开发中请用getx进行数据驱动
        onPressed: () {
          var boxstate = _globalKey.currentState as _BoxState;
          var boxWidget = _globalKey.currentWidget as Box;
          print(boxstate._count); // 获取子state的count
          setState(() {
            boxstate._count++;
            // boxWidget.color = boxWidget.color == Colors.red ? Colors.blue : Colors.red;
          });
          // 调用子state的方法
          boxstate.run();

          // 上面的是获取_BoxState的属性
          // 现在获取子widget，Box的属性，注意不是子state
          print(boxWidget.color);

          // 获取子组件渲染的属性
          var renderBox = _globalKey.currentContext!.findRenderObject() as RenderBox;
          print(renderBox.size);
        },
      ),
    );
  }
}

// 子widget
class Box extends StatefulWidget {
  Color color;

  Box({
    super.key,
    this.color = Colors.white,
  }); // super.key表示把key传给父类

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;
  Color _color = Colors.red;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _color = widget.color;
  }
  void run() {
    print("我是box的run方法");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(_color),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(color: Colors.red),
          )),
        ),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Text(
          "${_count}",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
