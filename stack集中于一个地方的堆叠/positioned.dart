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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello I am here"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black12,
      body: MyStack(),
    );
  }
}

// ignore: must_be_immutable
class MyStack extends StatelessWidget {
  List<Widget> list = [];
  MyStack({super.key}) {
    for (var i = 1; i <= 30; ++i) {
      list.add(ListTile(
        title: Text("我是腻叠$i"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      // 外部为stack
      // alignment: Alignment.center, // 子元素的显示位置
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 50),
          children: list,
        ),
        Positioned(
          // 配置二级导航
          left: 0,
          top: 0,
          width: size.width,
          height: 44,
          child: Row(
            // 二级导航，但是第一行会被挡住，需要来个padding占位
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 44,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text("二级导航"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
