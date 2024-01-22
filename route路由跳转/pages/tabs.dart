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
      drawer: const Drawer(
        // 左侧侧边栏
        child: Column(
          // 侧边栏由列表组成
          children: [
            Row(
              children: [
                Expanded( // 让顶部铺满侧边栏宽度
                  flex: 1,
                  // child: DrawerHeader( // 侧边栏顶部，提供自定义头部的设置
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //     image: DecorationImage(
                  //       image: NetworkImage("https://www.scut.edu.cn/_upload/site/00/03/3/logo.png"),
                  //     ),
                  //   ),
                  //   child: Column( // 侧边栏顶部放置用户账号名等信息
                  //     children: [
                  //       ListTile(
                  //         leading: CircleAvatar(
                  //           child: Image.network("https://static.licdn.com/aero-v1/sc/h/dbvmk0tsk0o0hd59fi64z3own",
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //         title: Text("张三"),
                  //         subtitle: Text("1xxxxxxxxx@qq.com"),
                  //       ),
                  //     ],
                  //   ), // 加载用户名、头像等
                  // ),
                  child: UserAccountsDrawerHeader( // flutter也提供了账户的轮子直接用
                    accountName: Text("Jayden Zhu",style: TextStyle(color: Colors.black),),
                    accountEmail: Text("122xxxxxxx@qq.com",style: TextStyle(color: Colors.black)),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage("https://github.githubassets.com/assets/footer-mona-d1c861cd8018.png"),
                    ),
                    // otherAccountsPictures: [], // 设置当前账户关联的其他账户头像，这里我注释了是因为我懒得加了
                    decoration: BoxDecoration( // 设置顶部背景颜色
                      color: Colors.blue,
                      image: DecorationImage(image: NetworkImage("https://www.scut.edu.cn/_upload/site/00/03/3/logo.png")),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              // 列表项设置
              leading: CircleAvatar(
                child: Icon(Icons.person_outline),
              ),
              title: Text("个人中心"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("设置"),
            ),
          ],
        ),
      ),
      endDrawer: const Drawer(
        child: Text("321"),
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
      floatingActionButton: ClipOval(
        // 白边是圆形
        child: Container(
          // 控制白边的大小为90,90和内部按钮的距离为5
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ClipOval(
            // 圆形按钮
            child: FloatingActionButton(
              // 浮动按钮
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              backgroundColor:
                  _selectedIndex == 2 ? Colors.yellow : Colors.blue,
              // 浮动按钮
              child: const Icon(Icons.add),
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
