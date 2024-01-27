import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './person.dart';
import './animal.dart';
import 'dart:math';

String getRandomString(int length){
  const characters = '+-*=?AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  Random random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,(_)=>characters.codeUnitAt(
        random.nextInt(
          characters.length
        )
      )
    )
  );
}

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget { // 其实用stateless也行
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  final RxInt _counter = 0.obs;
  final RxString _username = "Jayden Zhu".obs;
  final RxList _list = ["张三","李四"].obs;
  var _sex = Rx<String>("男");

  var person = new Person(); // 类本就是添加了obs响应的
  var animal = new Animal(username: "Cat", age: 2).obs; // 类是普通的类，在此转为obs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text( // 响应式状态管理，在counter的value变化时可以不需要setstate直接刷新组件
              "$_counter",// 1. int类
              style: Theme.of(context).textTheme.headlineLarge,
              ),
            ), 
            SizedBox(),
            Obx(() => Text(
              _username.value, // 2. String类
              style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(),
            Obx((){ // 3. list类
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _list.map((element) => ListTile(title: Text(element),)).toList(),
              );
            }),
            SizedBox(),
            // 4. String类另一种使用方法
            Obx(() => Text(_sex.value,style: Theme.of(context).textTheme.headlineMedium,)),
            SizedBox(),
            // 5. 传入obs类实例，此时不需要用value因为类成员就是rx
            Obx(() => Text("${person.username}",style: Theme.of(context).textTheme.headlineMedium,)),
            SizedBox(),
            // 6. 传入经过obs转化的类实例，此时需要value因为类成员还是普通的
            Obx(() => Text("${animal.value.username}",style: Theme.of(context).textTheme.headlineMedium,))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _counter.value++;
          _username.value = getRandomString(6); // 得到随机字符串
          _list.add("王五"); // 注意list不需要取value
          _sex.value = _sex.value == "男" ? "女" : "男";
          person.username.value = person.username.value.toUpperCase();

          animal.value.username = "Dog"; // 只是这么做这样没法改，因为animal.value才是响应式的
          animal.value = animal.value; // 加上这个来更新状态
        },
      ),
    );
  }
}