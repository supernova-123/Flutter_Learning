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
          title: const Text("WOW YOU DO IT WELL!"),
          backgroundColor: Colors.amber,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            // 构造宽度比为1:2的组件
            // 此时设置宽度没有效果
            children: [
              Expanded(
                flex: 1,
                child: IconWidget(Icons.home, Colors.red),
              ),
              Expanded(
                flex: 2,
                child: IconWidget(Icons.airline_seat_flat_angled, Colors.green),
              ),
            ],
          ),
          const Divider(),
          Row(
            // 设置左侧自适应，右侧固定不变
            children: [
              Expanded(
                flex: 1,
                child: IconWidget(Icons.add_to_home_screen_outlined, Colors.purple),
              ),
              IconWidget(Icons.biotech_outlined, Colors.orange), // 120*120
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class IconWidget extends StatelessWidget {
  IconData icon;
  Color color;
  IconWidget(this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      height: 120,
      width: 120,
      child: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
