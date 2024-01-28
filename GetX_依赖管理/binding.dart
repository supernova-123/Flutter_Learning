import 'package:get/get.dart';
import './controller.dart';

/// getx的binding能够通过懒加载让每个controller在用到的时候才会加载，不那么浪费内存和cpu

class ControlBindings implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CounterController(), tag: "counter0");
    Get.lazyPut(() => ListController(), tag: "list0");
  }
}