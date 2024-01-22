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
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter listview test"),),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView( // 可以滑动的列表
      // scrollDirection: Axis.horizontal, // 水平列表，有ListTile时不可用
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.home), // 列表项左侧的东西
          title: Text("首页"),
        ), // 列表项
        const Divider(), // 下划线
        const ListTile(
          leading: Icon(Icons.assignment),
          title: Text("全部订单"),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.payment),
          title: Text("待付款"),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.star),
          title: Text("收藏"),
          trailing: Icon(Icons.chevron_right_sharp), // 列表项尾部的东西
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.people),
          title: Text("联系客服"),
        ),
        const Divider(),
        ListTile(
          leading: Image.network("https://i2.chinanews.com/simg/smimg/2017/05/08/4357e9aa411b4fcfa0282c0bd103e175.jpg"),
          title: const Text("中央纪委全会部署强化反腐败“惩、治、防”"),
          subtitle: const Text("中国共产党第二十届中央纪律检查委员会第三次全体会议于1月8日至10日在北京举行，全会就2024年纪检监察工作作出部署"),
        ),
        const Divider(),
        Image.network("https://assets.leetcode.cn/aliyun-lc-upload/users/jayden-zhu/avatar_1641826627.png"),

      ],
    );
  }
}