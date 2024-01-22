import 'package:flutter/material.dart';
import 'iconlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'What an amazing feature!',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text("Flutter dynamic listview test")),
          body: MyHomePage3(),
        ));
  }
}

// for循环创建列表
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  List<Widget> _initListData() {
    // 私有方法
    /**定义个list的循环数组 */
    List<Widget> list = [];
    for (var i = 0; i < 20; ++i) {
      list.add(ListTile(
        title: Text("我是一个列表$i"),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _initListData(),
    );
  }
}

// list的map方法创建列表
class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  List<Widget> _initListData() {
    var tempList = listData.map((value) {
      return ListTile(
        leading: Image.network("${value["imageUrl"]}"),
        title: Text("${value["title"]}"),
        subtitle: Text("${value["author"]}"),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _initListData(),
    );
  }
}

// 用ListView的builder方法
// ignore: must_be_immutable
class MyHomePage3 extends StatelessWidget {
  List<String> list = [];
  MyHomePage3({super.key}) {
    for (var i = 0; i < 10; ++i) {
      list.add("我是第$i条数据");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length, // 遍历长度
        itemBuilder: (context, index) { // 获取迭代下标
          return ListTile(
            title: Text(list[index]),
            subtitle: Text(context.toString()),
          );
        });
  }
}
