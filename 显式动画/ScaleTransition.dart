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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, // 让程序和手机刷新频率统一
      duration: Duration(seconds: 1), // 每多久一次循环
      lowerBound: 0.5, // 在[0.5,1]之间循环
      upperBound: 1,
    );
    _controller.addListener(() {
      print(_controller.value); // 不断获取logo的不透明度
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RotationTransition"),
        backgroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.repeat();
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _controller,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.repeat();
                  },
                  child: Text("Repeat"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: Text("Forward"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.stop();
                  },
                  child: Text("Stop"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.reset();
                  },
                  child: Text("Reset"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.reverse();
                  },
                  child: Text("Reverse"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.repeat(reverse: true); // 从小到大再从大到小
                  },
                  child: Text("Reverse Repeat"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
