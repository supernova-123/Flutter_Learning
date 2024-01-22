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
          title: Text("Could you play Card with me?"),
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          children: [
            Card(
              // 卡片是个列表
              // color: Colors.redAccent,
              margin: EdgeInsets.all(10), // 设置边距
              elevation: 10, // 阴影，越大越长
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // 圆角
              ),
              // ignore: prefer_const_constructors
              child: Column(
                children: [
                  ListTile(
                    title: Text("张三"),
                    subtitle: Text("高级软件工程师"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("电话：17027492779"),
                  ),
                  ListTile(
                    title: Text("地址：大峪市蓬门县钟秀路318号"),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10, // 阴影，越大越长
              child: Column(
                children: [
                  ListTile(
                    title: Text("李四"),
                    subtitle: Text("架构工程师"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("电话：14525492919"),
                  ),
                  ListTile(
                    title: Text("地址：德胜市利合镇紫山路89号"),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10, // 阴影，越大越长
              child: Column(
                children: [
                  ListTile(
                    title: Text("陈家乐"),
                    subtitle: Text("系统测试工程师"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("电话：17027498911"),
                  ),
                  ListTile(
                    title: Text("地址：通纬市瑟步区中山路243号"),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10, // 阴影，越大越长
              child: Column(
                children: [
                  ListTile(
                    title: Text("羅伟达"),
                    subtitle: Text("算法工程师"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("电话：18839820907"),
                  ),
                  ListTile(
                    title: Text("地址：廓台市西门县图门北路256号"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
