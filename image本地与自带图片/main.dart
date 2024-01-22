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
      home: Scaffold(
        appBar: AppBar(title: const Text("Image练习")),
        body: const Column(
          children: [
            MyImage(),
            LocalImage(),
          ],
        )
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0,50, 0, 50),
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
        // child: Image.network(
        //   'https://picsum.photos/250?image=9',
        //   // scale: 2.0, // 图片缩小为1/2
        //   width: 200,
        //   // fit: BoxFit.fill, // 图片填满父容器，图片会变形
        //   // fit: BoxFit.cover, // 图片剪裁，充满容器，并不变形
        //   // repeat: ImageRepeat.repeat, // 图片横向重复
        // ), // 从网页获取图片
        child: const CircleAvatar( // 圆形图片
          backgroundImage: NetworkImage('https://dwdwd.com'), // 网址不存在时，默认使用背景颜色+用户首字母作为头像
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          radius: 25,
          child: Text("tt", style: TextStyle(fontSize: 50),),
        ),
        // 也可以用ClipOval或者Container的image属性来设置椭圆图片和圆角图片
      ),
    );
  }
}

class LocalImage extends StatelessWidget {
  const LocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.asset("images/stone.jpg",fit: BoxFit.cover,),
    );
  }
}