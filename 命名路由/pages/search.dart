import 'package:flutter/material.dart';

// 接收上个页面传入的参数
class SearchPage extends StatefulWidget {
  // String title;
  final Map arguments; // 命名路由传值一定要有这个
  const SearchPage({super.key, required this.arguments});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索结果：${widget.arguments["title"]}"), // 直接用widget.title就能获取SeachPage的变量
      ),
      body: const Center(
        child: Text("我也是搜索页面"),
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            // 返回到上一页
            Navigator.pop(context);
          },
          child: const Icon(Icons.home),
        ),
      ),
    );
  }
}
