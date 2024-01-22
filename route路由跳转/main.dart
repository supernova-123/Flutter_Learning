import 'package:flutter/material.dart';
// import './pages/tabs.dart';
// import './pages/form.dart';
// import './pages/news.dart';
// import './pages/search.dart';
import './pages/Routes.dart';

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
      // home: const Tabs(),
      // routes: {
      //   // 命名路由
      //   "/": (context) => const Tabs(),
      //   "/news": (context) => const NewsPage(),
      //   "/search": (context, {title}) => SearchPage(
      //         title: title,
      //       ),
      //   "/form": (context) => const FormPage(),
      // },
      initialRoute: "/",
      //2. 配置onGenerateRoute
      onGenerateRoute: onGenerateRoute,
    );
  }
}
