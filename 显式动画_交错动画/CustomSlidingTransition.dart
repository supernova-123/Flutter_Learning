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
      home: const HomePage(),
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
  bool flag = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("交错动画"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 设计3个不同颜色的区块
          // 在0~1/3、1/3~2/3秒、2/3~1秒钟三个区块分别向右移动一段距离
          children: [
            SlideTransition(
              //1.
              position: _controller.drive(
                Tween(
                  begin: const Offset(0, 0),
                  end: const Offset(1.0, 0),
                ).chain(CurveTween(
                  curve: const Interval(0.0, 1.0 / 3),
                )),
              ),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[300],
              ),
            ),
            SlideTransition(
              //2.
              position: _controller.drive(
                Tween(
                  begin: const Offset(0, 0),
                  end: const Offset(2.0 / 3, 0),
                ).chain(CurveTween(
                  curve: const Interval(1.0 / 3, 2.0 / 3),
                )),
              ),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[500],
              ),
            ),
            SlideTransition(
              //3.
              position: _controller.drive(
                Tween(
                  begin: const Offset(0, 0),
                  end: const Offset(1.0 / 3, 0),
                ).chain(CurveTween(
                  curve: const Interval(2.0 / 3, 1),
                )),
              ),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: const Text("forward"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.reset();
                  },
                  child: const Text("reset"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.reverse();
                  },
                  child: const Text("reverse"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.repeat();
                  },
                  child: const Text("repeat"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.repeat(reverse: true);
                  },
                  child: const Text("repeat & reverse"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
