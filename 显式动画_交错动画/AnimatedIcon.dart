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
          _controller.repeat(reverse: true);
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
            AnimatedIcon(
              icon: AnimatedIcons.close_menu, // 从close过渡到menu
              progress: _controller,
              size: 40,
            ),
            const SizedBox(height: 40,),
            AnimatedIcon(
              icon: AnimatedIcons.add_event, // 从close过渡到menu
              progress: _controller,
              size: 40,
            ),
            const SizedBox(height: 40,),
            AnimatedIcon(
              icon: AnimatedIcons.ellipsis_search, // 从close过渡到menu
              progress: _controller,
              size: 40,
            ),
            const SizedBox(height: 40,),
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
