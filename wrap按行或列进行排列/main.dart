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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Damn whats going on?"),
          backgroundColor: Colors.amber,
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  List<Widget>getBtnList(){
    List<Widget>list = [];
    for(var i = 1;i <= 26;++i){
      list.add(
        Button("第$i集", onPressed: (){})
      );
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap( // 流布局：每一行容纳不下的时候会挤到第二行
        direction: Axis.vertical, // 默认按行显示，设置Axis.vertical后改为垂直显示
        spacing: 10, // 水平间距
        runSpacing: 10, // 垂直间距
        children: getBtnList(),
      ),
    );
  }
}

// 自定义按钮
class Button extends StatelessWidget {
  String text;
  void Function()? onPressed; // 要传入的点击事件方法
  Button(this.text,{super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 12, 99, 143),
        ),
        foregroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      onPressed: this.onPressed,
      child: Text(text),
    );
  }
}