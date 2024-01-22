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
          ElevatedButton(
            onPressed: (){ // 点击按钮后跳转到search页面
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SearchPage(title: "Jayden Zhu",),
                ),
              );
            }, 
            child: Text("搜索：Jayden Zhu"),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){ // 点击按钮后跳转到search页面
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const FormPage(),
                ),
              );
            }, 
            child: Text("跳转到表单页面"),
          ),
        ],
      ),
    );
  }
}