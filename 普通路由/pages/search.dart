import 'package:flutter/material.dart';

// 接收上个页面传入的参数
class SearchPage extends StatefulWidget {
  String title;
  SearchPage({super.key, this.title = "搜索"});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索结果：${widget.title}"), // 直接用widget.title就能获取SeachPage的变量
      ),
      body: Center(
        child: Text("我也是搜索页面"),
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            // 返回到上一页
            Navigator.pop(context);
          },
          child: Icon(Icons.home),
        ),
      ),
    );
  }
}
