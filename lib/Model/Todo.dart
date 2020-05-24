import 'package:mobx/mobx.dart';

part 'Todo.g.dart';
class Todo = TodoBase with _$Todo;
abstract class TodoBase with Store{
  TodoBase({this.id,this.title,this.description});
  @observable
  int id;

  @observable
  String title;

  @observable
  String description;

  @observable
  bool done = false;
}