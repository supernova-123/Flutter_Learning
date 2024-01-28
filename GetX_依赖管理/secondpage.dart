import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './controller.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // 获取主页的计数器实例
  CounterController counterController = Get.find(tag: "counter0"); // 共享该实例
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${counterController.counter}",
                style: TextStyle(fontSize: 60),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 在这里操作counter也会影响主界面
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
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
