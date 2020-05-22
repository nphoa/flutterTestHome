import 'package:mobx/mobx.dart';

class Counter{
  final observable = Observable(0);

  Action increment;

  Counter(){
    increment = Action(_increment);
  }
  _increment(){
      observable.value ++;
  }
}