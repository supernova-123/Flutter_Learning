import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang/language.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 多语言"),
          backgroundColor: Colors.amber,
        ),
        body: HomePage(),
      ),
      // 语言和翻译
      translations: Messages(), // 配置翻译
      locale: Locale('zh', 'CN'), // 按照此处指定的语言翻译
      fallbackLocale: Locale('en', 'US'), // 回调语言选项，以备上面指定的语言不存在
    );
  }
}

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
          Text("hello".tr),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {Get.updateLocale(Locale('zh','CN'));}, child: Text("切换到中文")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {Get.updateLocale(Locale('en','US'));}, child: Text("切换到英文")),
        ],
      ),
    );
  }
}
