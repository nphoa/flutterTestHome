import 'package:flutterapp2/Model/Todo.dart';
import 'package:flutterapp2/db/todo_table.dart';
import 'package:mobx/mobx.dart';
part 'TodoList.g.dart';

enum VisibilityFilter { all, pending, completed }

class TodoList = TodoListBase with _$TodoList;
abstract class TodoListBase with Store{
  TodoListBase(){
    initTodo();
  }

  @observable
  List<Todo> todos = List<Todo>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @observable
  String currentDescription = '';
  
  @computed
  List<Todo> get pendingTodos =>
        todos.where((element) => element.done == 0).toList();

  @computed
  List<Todo> get completedTodos =>
      (todos.where((element) => element.done == 1)).toList();

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  @computed
  List<Todo> get visibleTodos {
    switch(filter){
      case VisibilityFilter.pending:
           return pendingTodos;
      case VisibilityFilter.completed:
           return completedTodos;
      default:
           return todos;
    }
  }

  @computed
  String get filterName {
    switch(filter){
      case VisibilityFilter.pending:
        return 'Pending';
      case VisibilityFilter.completed:
        return 'Completed';
      default:
        return 'All';
    }
  }

  @action
  void addTodo(Todo instance){
    if(instance.id == 0){
      instance.id = findIdFinal() + 1;
      TodoTable.getInstance().insertTodo(instance);
      initTodo();
      return;
    }
    Todo instanceUpdate = findTodo(instance.id);
    instanceUpdate.title = instance.title;
    instanceUpdate.description = instance.description;
    currentDescription = '';
  }

  @action
  void deleteTodo(Todo instance){
    TodoTable.getInstance().deleteTodo(instance);
    initTodo();
  }

  @action
  Future<void> initTodo() async{
    todos = await TodoTable.getInstance().getAllTodo(0);
    print(todos);
  }
  
  @action
  Todo findTodo(int index){
    Todo instance = todos.where((i) => i.id == index).first;
    return instance;
  }

  @action
  int findIdFinal(){
    if(todos.length == 0 ){return 1;}
    return todos[todos.length -1].id;
  }

  @action
  Future<void> changeStatus(Todo instance) async{
    var instanceUpdate =await TodoTable.getInstance().getAllTodo(instance.id);
    //instanceUpdate.done = !instance.done;
    instanceUpdate[0].done = (instance.done == 0) ? 1 : 0;
    TodoTable.getInstance().updateTodo(instanceUpdate[0]);
    initTodo();
   // print(test[0]);

  }

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;
}