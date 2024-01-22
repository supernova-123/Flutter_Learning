import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  final String title;
  final String content;
  final Function()? onTap; // 自定义退出按钮点击事件
  MyDialog({
    super.key, 
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 设置背景透明
      child: Center(
        // 如果把container放到外面的话会导致整个屏幕被占满
        child: Container(
          height: 200,
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title,style: TextStyle(fontSize: 18)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: this.onTap,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text(content,style: TextStyle(fontSize: 14),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
