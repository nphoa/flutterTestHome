import 'package:mobx/mobx.dart';

part 'Todo.g.dart';
class Todo = TodoBase with _$Todo;
abstract class TodoBase with Store{
  TodoBase({this.id,this.title,this.description,this.done});
  @observable
  int id;

  @observable
  String title;

  @observable
  String description;

  @observable
  int done = 0;

  Map<String,dynamic> toMap(){
    return {
      'id' :id,
      'title' : title,
      'description':description,
      'done':done
    };
  }
  static bool intToBool(int a) => a == 0 ? false : true;
}