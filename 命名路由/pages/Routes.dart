// ignore_for_file: file_names

import 'package:flutter/material.dart';
import './tabs.dart';
import './form.dart';
import './news.dart';
import './search.dart';

final Map routes = {
  // 1.配置命名路由
  "/": (context) => const Tabs(),
  "/news": (context) => const NewsPage(),
  "/search": (context, {arguments}) => SearchPage(
        arguments: arguments,
      ),
  "/form": (context) => const FormPage(),
};

// 固定写法
var onGenerateRoute=(RouteSettings settings){
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name];
  if(settings.arguments != null){
    final Route route = MaterialPageRoute(builder: (context)=>
      pageContentBuilder(context,arguments:settings.arguments));
      return route;
  }
  else{
    final Route route = MaterialPageRoute(
      builder: (context)=> pageContentBuilder(context)
    );
    return route;
  }
};