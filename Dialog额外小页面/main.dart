import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  void _alertDialog() async { // 异步加上async来获取值
    var result = await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("提示信息"),
        content: Text("你确定要删除吗？"),
        actions: [
          TextButton(
            onPressed: (){
              print("OK");
              Navigator.of(context).pop("ok"); // 点击后返回，result获取ok
            }, 
            child: Text("确定")
          ),
          TextButton(
            onPressed: (){
              print("CANCEL");
              Navigator.of(context).pop("kong ok"); // 点击后返回，result获取kong ok
            }, 
            child: Text("取消")
          ),
        ],
      );
    });

    print(result);
  }

  void _simpleDialog(){
    // barrierDismissible=false表示点击屏幕其他区域不会退出选框
    showDialog(barrierDismissible: false, context: context, builder: (context){
      return SimpleDialog(
        title: Text("请选择语言"),
        children: [
          Divider(), // simpledialog里面也是可以放别的东西的
          SimpleDialogOption(
            onPressed: (){
              print("你点击了汉语！");
              Navigator.of(context).pop("ok");
            },
            child: Text("汉语"),
          ),
          Divider(),
          SimpleDialogOption(
            onPressed: (){
              print("你点击了英语！");
              Navigator.of(context).pop("ok");
            },
            child: Text("英语"),
          ),
          Divider(),
          SimpleDialogOption(
            onPressed: (){
              print("你点击了日语！");
              Navigator.of(context).pop("ok");
            },
            child: Text("日语"),
          ),
          Divider(),
        ],
      );
    });
  }


  void _toast(){
    Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT, // 只针对android平台
      gravity: ToastGravity.TOP, // 方位
      timeInSecForIosWeb: 1, // 针对ios和web平台
      backgroundColor: Colors.red, // 背景颜色
      textColor: Colors.white, // 文本颜色
      fontSize: 16.0, // 文本字体大小
    );
  }

  void _modalBottomSheet() async{
    var result = await showModalBottomSheet(context: context, builder: (context){
      return SizedBox(
        height: 300, // 可以调整底部选框高度
        // width: double.infinity,
        child: Column(
          children: [
            ListTile(
              title: Text("分享"),
              onTap: (){
                print("分享");
                Navigator.of(context).pop("分享");
              },
            ),
            ListTile(
              title: Text("收藏"),
              onTap: (){
                print("收藏");
                Navigator.of(context).pop("收藏");
              },
            ),
            ListTile(
              title: Text("取消"),
              onTap: (){
                print("取消");
                Navigator.of(context).pop("取消");
              },
            ),
          ],
        ),
      );
    });

    print(result+"what");
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
              onPressed: _alertDialog, 
              child: Text("测试AlertDialog"),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: _simpleDialog,
              child: Text("测试SimpleDialog"),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: _modalBottomSheet,
              child: Text("测试modalBottomSheet"),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: _toast,
              child: Text("测试外部插件fluttertoast"),
            ),
          ],
        ),
      ),
    );
  }
}