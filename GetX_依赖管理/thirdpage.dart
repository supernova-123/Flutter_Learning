import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './controller.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  ListController listController = Get.find(tag: "list0");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三页"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
