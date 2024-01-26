import 'package:flutter/material.dart';
import 'package:get/get.dart'; // 安装get: ^4.6.6
// getx的dialog: 简单、完全抛弃context
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _alertDialog(context) async {
    // ignore: unused_local_variable
    var result = await showDialog(
      barrierDismissible: false, // 点击灰色背景会关闭dialog
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text("提示信息"),
          content: const Text("您确定要删除吗？"),
          actions: [
            TextButton(
              onPressed: (){Navigator.of(context).pop("yes");}, 
              child: const Text("确定"),
            ),
            TextButton(
              onPressed: (){Navigator.of(context).pop("no");}, 
              child: const Text("取消"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Application"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                _alertDialog(context);
              }, 
              child: const Text("Flutter默认Dialog"),
            ),
            ElevatedButton( // 1. defaultDialog
              onPressed: (){
                Get.defaultDialog(
                  title: "提示信息",
                  middleText: "您确定要删除吗？",
                  confirm: ElevatedButton(
                    onPressed: (){
                      // do something
                      Get.back();
                    }, 
                    child: const Text("确定"),
                  ),
                  cancel: ElevatedButton(
                    onPressed: (){
                      // do something
                      Get.back();
                    }, 
                    child: const Text("取消"),
                  ),
                );
              }, 
              child: const Text("我要选择Get.defaultDialog"),
            ),
            ElevatedButton( // 2. snackbar 默认是弹出的提示框，并在一段时间后消失
              onPressed: (){
                Get.snackbar(
                  "提示", 
                  "您还没有登录！",
                  snackPosition: SnackPosition.BOTTOM, // 显示到页面底部
                );
              }, 
              child: const Text("我要选择Get.snackbar"),
            ),
            ElevatedButton( // 3. bottomSheet 实现白天黑夜主题切换
              onPressed: (){
                Get.bottomSheet(
                  Container(
                    color: Get.isDarkMode ? Colors.black26 : Colors.white,
                    height: 200,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.wb_sunny_outlined, color: Get.isDarkMode ? Colors.white : Colors.black87,),
                          onTap: (){
                            Get.changeTheme(ThemeData.light());
                            print("改成白天模式");
                            Get.back(); // 记得点击之后返回
                          },
                          title: Text("白天模式", style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black87),),
                        ),
                        ListTile(
                          leading: Icon(Icons.nightlight_outlined, color: Get.isDarkMode ? Colors.white : Colors.black87,),
                          onTap: (){
                            Get.changeTheme(ThemeData.dark());
                            print("改成夜间模式");
                            Get.back();
                          },
                          title: Text("夜间模式", style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black87),),
                        ),
                      ],
                    ),
                  ),
                );
              }, 
              child: const Text("我要选择Get.bottomSheet"),
            ),
          ].map((e){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}