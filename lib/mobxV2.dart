import 'package:mobx/mobx.dart';

part 'mobxV2.g.dart';
class CounterV2 = CounterBase with _$CounterV2;
abstract class CounterBase with Store{

  @observable
  int value = 0;

  @action
  void increment(){
    value++;
  }
}