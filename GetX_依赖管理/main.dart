import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './secondpage.dart';
import './thirdpage.dart';
import './binding.dart';
import './controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControlBindings(), // 定义全局绑定的Getx controller
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("依赖管理"),
          backgroundColor: Colors.amber,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var counterController = Get.put(CounterController(), tag: "counter0"); // 如果没有绑定的话可以用这个实时绑定
  var counterController = Get.find<CounterController>(tag: "counter0"); // 一定要指定find的<类型>
  // var listController = Get.put(ListController(), tag: "list0"); // 如果没有绑定的话可以用这个实时绑定
  var listController = Get.find<ListController>(tag: "list0");
  @override
  Widget build(BuildContext context) {
    return ListView( // 让页面可以滑动
      children: [
        Center( // 让页面居中
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, // 让column居中
            children: [
              // 计数器类
              Obx(() => Text(
                    "${counterController.counter}",
                    style: TextStyle(fontSize: 60),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      counterController.inc();
                    },
                    icon: Icon(Icons.add),
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  ),
                  IconButton(
                    onPressed: () {
                      counterController.dec();
                    },
                    icon: Icon(Icons.remove),
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => SecondPage());
                  },
                  child: Text("前往计数器页面！")),

              // 列表类
              Obx(() {
                return Column(
                  children: listController.list.map((element) {
                    return ListTile(
                      title: Text("$element"),
                    );
                  }).toList(),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      listController.inc("我是新增项");
                    },
                    icon: Icon(Icons.add),
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  ),
                  IconButton(
                    onPressed: () {
                      listController.dec();
                    },
                    icon: Icon(Icons.remove),
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => ThirdPage());
                  },
                  child: Text("前往列表页面！")),
            ].map((e) => Column(children: [e,SizedBox(height: 40)],)).toList(), // 让每行之间有间距
          ),
        ),
      ],
    );
  }
}
