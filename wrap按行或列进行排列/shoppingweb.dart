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

  List<Widget> getBtnList() {
    List<Widget> list = [];
    for (var i = 1; i <= 26; ++i) {
      list.add(Button("第$i集", onPressed: () {}));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 购物网站搜索栏内容
     */
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Row(
          children: [
            Text(
              "热搜",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const Divider(),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Button("秋天女装", onPressed: () {}),
            Button("高跟鞋", onPressed: () {}),
            Button("靴子", onPressed: () {}),
            Button("运动裤", onPressed: () {}),
            Button("帽子", onPressed: () {}),
            Button("洗面奶", onPressed: () {}),
            Button("护手霜", onPressed: () {}),
            Button("运动鞋", onPressed: () {}),
            Button("休闲裤", onPressed: () {}),
            Button("长筒袜", onPressed: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "历史记录",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const Divider(),
        Column(
          // ListView内不能有ListView，要用Column代替
          children: [
            ListTile(
              title: Text("女装"),
            ),
            Divider(),
            ListTile(
              title: Text("男装"),
            ),
            Divider(),
            ListTile(
              title: Text("手机"),
            ),
            Divider(),
            ListTile(
              title: Text("电脑"),
            ),
            Divider(),
          ],
        ),
        const SizedBox(height: 40),
        Padding( // 自适应居中
            padding: EdgeInsets.fromLTRB(150, 40, 150, 40),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.delete),
              label: Text("清空历史记录"),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.black45),
                
              ),
            )),
      ],
    );
  }
}

// 自定义按钮
class Button extends StatelessWidget {
  String text;
  void Function()? onPressed; // 要传入的点击事件方法
  Button(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 222, 221, 223),
        ),
        foregroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 8, 6, 6),
        ),
      ),
      onPressed: this.onPressed,
      child: Text(text),
    );
  }
}
