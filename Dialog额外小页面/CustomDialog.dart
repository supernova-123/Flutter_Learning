import 'package:flutter/material.dart';
import './widget/myDialog.dart';
// import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  void _myDialog() async {
    var result = await showDialog(context: context, builder: (context){
      return MyDialog(
        title: "提示",
        content: "我是一个内容",
        onTap: (){
          print("我退出了！");
          Navigator.of(context).pop("回到上一页了！");
        },
      );
    });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Test"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _myDialog,
              child: Text("自定义dialog"),
            ),
          ],
        ),
      ),
    );
  }
}