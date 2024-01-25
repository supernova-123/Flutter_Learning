// ignore_for_file: file_names

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
      duration: const Duration(milliseconds: 500),
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
          children: [
            Stack(
              children: [
                // 设计一个动画：0~0.5秒search消失 0.5~1秒close显示
                ScaleTransition(
                  scale: _controller.drive(
                    // 0.5~1秒让close从0到1
                    Tween(
                      begin: 0.0,
                      end: 1.0,
                    ).chain(
                      CurveTween(
                        curve: const Interval(0.5, 1.0),
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 40,
                  ),
                ),
                ScaleTransition(
                  scale: _controller.drive(
                    // 0~0.5秒让search从1到0
                    Tween(
                      begin: 1.0,
                      end: 0.0,
                    ).chain(
                      CurveTween(
                        curve: const Interval(0, 0.5),
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ],
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
