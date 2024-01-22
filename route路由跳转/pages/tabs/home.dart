import 'package:flutter/material.dart';
import '../search.dart';
import '../form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1.基本路由跳转
          ElevatedButton(
            onPressed: () {
              // 点击按钮后跳转到search页面
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const SearchPage(
                    arguments: {"title":"我是基本路由跳转"},
                  ),
                ),
              );
            },
            child: const Text("基本路由搜索：Jayden Zhu"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // 点击按钮后跳转到search页面
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const FormPage(),
                ),
              );
            },
            child: const Text("基本路由跳转到表单页面"),
          ),
          const SizedBox(
            height: 20,
          ),
          // 2.命名路由跳转
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/news");
              },
              child: const Text("命名路由跳转news，不需要引入news.dart")),
        ],
      ),
    );
  }
}
