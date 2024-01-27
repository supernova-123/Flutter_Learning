import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      navigatorKey: Get.key,
      getPages: [ // 配置url路由
        GetPage(name: "/", page: () => First()),
        GetPage(name: "/first", page: () => First()),
        GetPage(name: "/second", page: () => Second()),
        GetPage(
            name: "/third",
            page: () => Third(),
            transition: Transition.cupertino),
      ],
      home: First(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class First extends StatelessWidget { // 1. 第一页
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ // 右侧按钮：提示信息
          IconButton( 
            icon: Icon(Icons.add),
            onPressed: () {
              Get.snackbar("hi", "i am the first page");
            },
          ),
        ],
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Get.toNamed("/second"); // <-- 进入第二页
          },
        ),
      ),
    );
  }
}

class Second extends StatelessWidget { // 2. 第二页
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.snackbar("hi", "i am the second page");
            },
          ),
        ],
        leading: IconButton( // 左侧返回
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back(); // <-- 返回
          },
        ),
        title: Text('second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Get.toNamed("/third"); // <-- 进入third
          },
        ),
      ),
    );
  }
}

class Third extends StatelessWidget { // 3. 第三页
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.snackbar("hi", "i am the third page");
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Third Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.until((route) => route.settings.name == '/'); // 返回到第一页
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
