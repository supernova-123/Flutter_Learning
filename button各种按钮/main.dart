import 'dart:html';

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
          title: Text(
            "Here are buttons",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.amber,
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print("You pressed elevated button");
                },
                child: Text("我是一个按钮")),
            TextButton(onPressed: () {}, child: Text("我是文本按钮")),
            OutlinedButton(onPressed: null, child: Text("带边框的按钮")),
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
                onPressed: () {}, icon: Icon(Icons.send), label: Text("发送")),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.info),
              label: Text("消息"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("增加"),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    // 设置圆角
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.red), // 背景颜色
                foregroundColor:
                    MaterialStatePropertyAll(Colors.white), // 文字（图标）颜色
              ),
              onPressed: () {},
              child: const Text("普通按钮"),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          // 使用大按钮，需要在外部用一个容器包裹
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60,
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("大按钮"),
              ),
            ),
            SizedBox(
              height: 60,
              width: 140,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search),
                label: const Text("搜索"),
              ),
            ),
          ],
        ),
        Row(
          // 占满整个屏幕的按钮
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(20),
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("登录"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 222, 71, 60)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.black,
                ),
                shape: MaterialStatePropertyAll(
                  CircleBorder(side: BorderSide(
                    color: Colors.green,
                  ))
                ),
              ),
              child: Text("圆形",style: TextStyle(color: Colors.white),),
            ),
          ],
        )
      ],
    );
  }
}
