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
      debugShowCheckedModeBanner: false, // 去掉debug图标
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
/**
 * AppBar和TabBar一起实现顶部导航栏
 */
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  List<Widget>list = [];
  late TabController _tabController;

  // 生命周期函数：组件初始化时会触发
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)), // 左侧的按钮图标
        title: Text("今日头条"),
        backgroundColor: Colors.red[400],
        actions: [ // 右侧的按钮图标
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
        ],
        bottom: TabBar(
          controller: _tabController, // 配置controller需要去掉TabBar的const
          indicatorColor: Colors.white, // 配置指示器（选择时出现的线）颜色
          indicatorWeight: 5, // 配置指示器高度，越大越厚
          indicatorPadding: EdgeInsets.fromLTRB(5, 5, 5, 5), // 指示器边距
          indicatorSize: TabBarIndicatorSize.tab, // 指示器长度适应哪个部件，如果是label，那么就会以字的长度为准，tab则为表项长度为准
          indicator: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(10), // 设置圆角
          ),
          // labelColor: Colors.yellow, // 选中时label的颜色
          // unselectedLabelColor: Colors.white, // 没选中时label的颜色
          labelStyle: TextStyle(fontSize: 14), // 配置选中label的style，用TextStyle即可
          unselectedLabelStyle: TextStyle(fontSize: 12),
          isScrollable: true, // 导航栏设置可以滑动，当然如果没那么多栏就没必要了
          tabs: [
            Tab(
              child: Text("关注"), // 点击关注会显示body中对应的列表内容
            ),
            Tab(
              child: Text("热门"),
            ),
            Tab(
              child: Text("视频"),
            ),
          ],
        ),
      ),
      body: TabBarView( // 列表数量要和上面的Tab数量一致
        controller: _tabController, // TabBar和TabBarView的controller都要获取
        children: [
          ListView(
            children: [
              ListTile(
                title: Text("我是关注列表"),
              ),
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text("我是热门列表"),
              ),
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text("我是视频列表"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}