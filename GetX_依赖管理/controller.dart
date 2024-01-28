import 'package:get/get.dart';

abstract class Calculator{
  void inc();
  void dec();
}

class CounterController extends GetxController implements Calculator{
  RxInt counter = 0.obs;

  @override
  void inc(){
    counter.value++;
    update();
  }
  @override
  void dec(){
    counter.value--;
    update();
  }
}

class ListController extends GetxController{
  RxList list = ["what",].obs;

  void inc(value){
    list.add(value);
    update();
  }

  void dec(){
    if(list.isEmpty){
      return;
    }
    list.removeLast();
    update();
  }
}