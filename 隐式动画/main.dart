// ignore_for_file: must_be_immutable

import 'dart:html';

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

class _HomePageState extends State<HomePage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      appBar: AppBar(
        title: Text("Animation Test1"),
        backgroundColor: Colors.amber,
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          AnimationContainerPage(
            flag: flag,
          ),
          AnimationPaddingPage(
            flag: flag,
          ),
          AnimationOpacityPage(
            flag: flag,
          ),
          AnimationPositionedPage(
            flag: flag,
          ),
          AnimationTextPage(
            flag: flag,
          ),
          AnimationSwicherPage(
            flag: flag,
          ),
        ],
      ),
    );
  }
}

class AnimationContainerPage extends StatefulWidget {
  bool flag;
  AnimationContainerPage({super.key, this.flag = true});

  @override
  State<AnimationContainerPage> createState() => _AnimationContainerPageState();
}

class _AnimationContainerPageState extends State<AnimationContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          AnimatedContainer(
            // 1. Container添加动画的版本
            duration:
                const Duration(seconds: 1, milliseconds: 100), // 1秒100毫秒进行动画的切换
            transform: widget.flag
                ? Matrix4.translationValues(0, 0, 0)
                : Matrix4.translationValues(
                    100, 0, 0), // 中心点从坐标0,0,0切换到坐标100,0,0
            width: widget.flag ? 100 : 300,
            height: widget.flag ? 100 : 300,
            color: Colors.blue[300],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class AnimationPaddingPage extends StatefulWidget {
  bool flag;
  AnimationPaddingPage({
    super.key,
    this.flag = true,
  });

  @override
  State<AnimationPaddingPage> createState() => _AnimationPaddingPageState();
}

class _AnimationPaddingPageState extends State<AnimationPaddingPage> {
  @override
  Widget build(BuildContext context) {
    var fromTop = widget.flag ? 10.0 : 200.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedPadding(
        // 2. Padding隐式动画
        curve: Curves.bounceIn, // 动画效果
        duration: Duration(seconds: 1),
        padding: EdgeInsets.fromLTRB(10, fromTop, 0, 0),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}

class AnimationOpacityPage extends StatefulWidget {
  bool flag;
  AnimationOpacityPage({super.key, this.flag = true});

  @override
  State<AnimationOpacityPage> createState() => _AnimationOpacityPageState();
}

class _AnimationOpacityPageState extends State<AnimationOpacityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedOpacity(
        // 3. Opacity透明度变化动画
        duration: Duration(seconds: 1),
        curve: Curves.bounceIn,
        opacity: widget.flag ? 1 : 0,
        child: Container(
          // padding: EdgeInsets.all(20),
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}

class AnimationPositionedPage extends StatefulWidget {
  bool flag;
  AnimationPositionedPage({super.key, this.flag = true});

  @override
  State<AnimationPositionedPage> createState() =>
      _AnimationPositionedPageState();
}

class _AnimationPositionedPageState extends State<AnimationPositionedPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    print(MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 4"),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 1),
            top: widget.flag ? 10 : size.height - 10 - 180,
            right: widget.flag ? 10 : size.width - 10 - 80,
            child: Container(
              width: 60,
              height: 60,
              color: Colors.grey,
            ),
          ),
          ListView(
            children: [
              ListTile(
                title: Text("我是一个列表"),
              ),
              ListTile(
                title: Text("我是一个列表"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimationTextPage extends StatefulWidget {
  bool flag;
  AnimationTextPage({super.key, this.flag = true});

  @override
  State<AnimationTextPage> createState() => _AnimationTextPageState();
}

class _AnimationTextPageState extends State<AnimationTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 5"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.orange,
          child: AnimatedDefaultTextStyle(
            // 5. 文字变换动画
            child: Text(key: UniqueKey(),widget.flag ? "你好 Flutter" : "我是 Jayden Zhu!"), // 使用UniqueKey使得组件类型改变，改变时才有动画
            style: TextStyle(
                fontSize: widget.flag ? 20 : 35,
                color: widget.flag ? Colors.red : Colors.black),
            duration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}

class AnimationSwicherPage extends StatefulWidget {
  bool flag;
  AnimationSwicherPage({super.key, this.flag = true});

  @override
  State<AnimationSwicherPage> createState() => _AnimationSwicherPageState();
}

class _AnimationSwicherPageState extends State<AnimationSwicherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 6"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 220,
          color: Colors.orange,
          child: AnimatedSwitcher( // 6. 当子元素改变时会触发动画
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child,); // 更改动画模式
            },
            duration: Duration(seconds: 1),
            child: widget.flag
                ? CircularProgressIndicator()
                : SizedBox(height: 150, width: 150, child: Icon(Icons.wallet_giftcard))
          ),
        ),
      ),
    );
  }
}
