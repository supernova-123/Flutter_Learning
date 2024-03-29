import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}
// 有状态组件
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo List Adding Test"),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: _list.map(
          (e){
            return ListTile(
              title: Text(e),
            );
          }
        ).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _list.add("我是一个新增列表");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}