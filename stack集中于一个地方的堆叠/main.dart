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
    // return Container(
    //   width: 300,
    //   height: 300,
    //   color: Colors.red,
    //   child: Align( // 容器内部放alignment
    //     // alignment: Alignment.center,
    //     alignment: Alignment(-0.5,0.5), // x=1,y=1为右下角，两个坐标取值为[-1,1]，x是从左到右，y是从上到下
    //     child: Text("Hello FLUTTER!"),
    //   ),
    // );
    return const SizedBox(
      width: double.infinity,
      height: 40,
      child: Stack( // 如果用Row，是不会有靠左和靠右的效果的
        children: [
          Align(alignment: Alignment.topLeft,child: Text("收藏"),),
          Align(alignment: Alignment.topRight,child : Text("购买"),)
        ],
      ),
    );
  }
}
