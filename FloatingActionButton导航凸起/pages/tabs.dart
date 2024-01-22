import 'package:fab/pages/tabs/play.dart';
import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/setting.dart';
import './tabs/user.dart';
import './tabs/play.dart';

// BottomNavigationBar: 底部导航栏
class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    PlayPage(),
    UserPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App"),
        backgroundColor: Colors.amber,
      ),
      body: _pages[_selectedIndex], // 加载选择的页面
      /**
       * 底部菜单栏
       */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 选择的菜单下标
        iconSize: 35, // 导航图标大小
        fixedColor: Colors.red, // 选中后变成什么颜色
        type: BottomNavigationBarType.fixed, // 如果底部有>=4个的菜单，需要配置type
        onTap: (index) {
          // 监听点击，传入索引值
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          // 导航栏内容
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "分区",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "发布",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置",
          ),
        ],
      ),
      floatingActionButton: ClipOval( // 白边是圆形
        child: Container( // 控制白边的大小为90,90和内部按钮的距离为5
          height: 90,
          width: 90,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ClipOval(
            // 圆形按钮
            child: FloatingActionButton(
              // 浮动按钮
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              backgroundColor: _selectedIndex == 2 ? Colors.yellow : Colors.blue,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // 浮动按钮位置
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
