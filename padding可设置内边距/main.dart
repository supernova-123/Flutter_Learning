import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Damn whats that?"),
          backgroundColor: Colors.blue,
        ),
        body: Container( // 外部是container
          alignment: Alignment.center,
          width: double.infinity, // 适应所有页面大小，令这个Container占满页面
          height: double.infinity,
          color: Colors.black12,
          child: Column( // 内部是Column，列自适应
            mainAxisAlignment: MainAxisAlignment.spaceAround, // 均匀分布在一行
            crossAxisAlignment: CrossAxisAlignment.center, // 这是控制次轴的位置，即在container中是居中的
            children: [
              IconContainer(Icons.home, color: Colors.red),
              IconContainer(Icons.search, color: Colors.blue),
              IconContainer(Icons.ac_unit_sharp, color: Colors.orange),
              IconContainer(Icons.access_alarm, color: Colors.orange),
              IconContainer(Icons.airline_seat_recline_extra_rounded, color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  // 实例化构造函数时把icon传入到this.icon，color为匿名参数
  IconContainer(this.icon,{super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      height: 120,
      width: 120,
      child: Icon(icon,color: Colors.white, size: 28 ,),
    );
  }
}