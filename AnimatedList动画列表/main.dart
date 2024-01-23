import 'dart:async';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _globalKey = GlobalKey<AnimatedListState>(); // <-- 注意实现添加和删除的animation需要此
  List<String> list = [
    "第一条",
    "第二条",
  ];
  bool flag = true;
  Widget _buildItem(index) {
    return ListTile(
      title: Text(list[index]),
      trailing: IconButton(
          onPressed: () {
            _deleteItem(index);
          },
          icon: Icon(Icons.delete)),
    );
  }

  void _deleteItem(index) {
    if (flag) {
      flag = false;
      print("删除的索引值${index}");
      _globalKey.currentState!.removeItem(index, (context, animation) {
        var removeitem = _buildItem(index); // 先创建一个备份
        list.removeAt(index); // 删掉list中的这个元素
        return FadeTransition(
          opacity: animation,
          child: removeitem,
        ); // 删除的时候执行动画的元素
      });
      // 解决快速删除的bug
      Timer.periodic(Duration(milliseconds: 500), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedList Test"),
        backgroundColor: Colors.amber,
      ),
      // 测试增加数据
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add("我是新增的数据");
            _globalKey.currentState!
                .insertItem(list.length - 1); // 增加数据，此处可以不用setState
          });
        },
        child: Icon(Icons.add),
      ),
      // AnimatedList只有在增删数据时才会出现动画
      body: AnimatedList(
        // 用list初始化AnimatedList
        key: _globalKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          // return FadeTransition( // Fadexxxxx是淡入淡出的动画效果
          //   opacity: animation,
          //   child: _buildItem(index), // 说明文字与删除数据按钮
          // );
          return ScaleTransition( // Scale是展开收回的动画效果
            scale: animation,
            child: _buildItem(index), // 说明文字与删除数据按钮
          );
        },
      ),
    );
  }
}
