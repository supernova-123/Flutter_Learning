import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// 网格布局
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter gridview test",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("GridView App")),
        // body: MyHomePage(),
        // body: MyHomePage2(),
        body: MyHomePage3(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5, // 配置一行的Widget数量
      children: const [
        Icon(Icons.pedal_bike),
        Icon(Icons.home),
        Icon(Icons.ac_unit),
        Icon(Icons.search),
        Icon(Icons.settings),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.circle),
      ],
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      // 通过extent可以快速创建横轴子元素为固定最大长度的GridView。
      maxCrossAxisExtent: 200, // 横轴子元素的最大长度
      children: const [
        Icon(Icons.pedal_bike),
        Icon(Icons.home),
        Icon(Icons.ac_unit),
        Icon(Icons.search),
        Icon(Icons.settings),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.circle),
      ],
    );
  }
}

class MyHomePage3 extends StatelessWidget {
  const MyHomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget>list = [];
    // TextEditingController con = TextEditingController();
    // var input = TextField(
    //   autofocus: true,
    //   decoration: const InputDecoration(
    //     labelText: "个数",
    //     hintText: "你的个数",
    //     prefixIcon: Icon(Icons.person),
    //   ),
    //   controller: con,
    //   onChanged: (value) {
    //     print("on Change: $value");
    //   },
    // );
    // print(con.text); // 输出输入框内内容
    // var x = con.text.isNotEmpty ? int.parse(con.text):4;
    // list.add(input);
    for(var i = 1;i <= 6;++i){
      list.add(
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          // margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text("第$i个元素",style: const TextStyle(
            fontSize: 20,
          ),),
        )
      );
    }
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(50),
      mainAxisSpacing: 10, // 配置垂直间距
      crossAxisSpacing: 10, // 配置水平间距
      childAspectRatio: 0.7, // 宽高比
      children: list,
    );
  }
} 