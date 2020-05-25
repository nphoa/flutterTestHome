import 'package:flutterapp2/Model/Todo.dart';
import 'package:mobx/mobx.dart';

part 'TodoList.g.dart';

enum VisibilityFilter { all, pending, completed }

class TodoList = TodoListBase with _$TodoList;
abstract class TodoListBase with Store{
  TodoListBase(){
    initTodo();
  }

  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @observable
  String currentDescription = '';
  
  @computed
  ObservableList<Todo> get pendingTodos =>
        ObservableList.of(todos.where((element) => element.done != true));

  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((element) => element.done == true));

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  @computed
  ObservableList<Todo> get visibleTodos {
    switch(filter){
      case VisibilityFilter.pending:
           return pendingTodos;
      case VisibilityFilter.completed:
           return completedTodos;
      default:
           return todos;
    }
  }

  @action
  void addTodo(Todo instance){
    if(instance.id == 0){
      instance.id = findIdFinal() + 1;
      todos.add(instance);
      return;
    }
    Todo instanceUpdate = findTodo(instance.id);
    instanceUpdate.title = instance.title;
    instanceUpdate.description = instance.description;
    currentDescription = '';
  }

  @action
  void deleteTodo(int index){
      todos.removeAt(index);
  }

  @action
  void initTodo(){
    todos.add(Todo(id: 1, title:'Learning',description: 'Learning Mobx'));
    todos.add(Todo(id:2,title:'Learning',description: 'Learning Flutter'));
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
  void changeStatus(Todo instance){
    Todo instanceUpdate = findTodo(instance.id);
    instanceUpdate.done = !instance.done;
    print(instanceUpdate);

  }

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;
}