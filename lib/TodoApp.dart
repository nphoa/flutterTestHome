import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp2/Model/Todo.dart';
import 'package:flutterapp2/TodoList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final todos =  TodoList();
  _showFormDialogAddTodo(BuildContext context,int id){
    TextEditingController _title = TextEditingController();
    TextEditingController _description = TextEditingController();
    if(id != 0){
      Todo instance = todos.findTodo(id);
      _title.text = instance.title;
      _description.text = instance.description;
    }
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                color: Colors.pinkAccent,
                onPressed: (){
                  if(id == 0){
                    Todo instance = Todo(id: 0,title: _title.text,description: _description.text,done: 0);
                    todos.addTodo(instance);
                  }else{
                    Todo instance = todos.findTodo(id);
                    instance.title = _title.text;
                    instance.description = _description.text;
                    todos.addTodo(instance);
                  }
                  _title.text = '';
                  _description.text = '';
                },
                child: Text('Save'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: (){Navigator.pop(context);},
                child: Text('Cancel'),
              ),
            ],
            title: Text("${(id == 0) ? 'Add' : 'Update'}"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _title,
                    decoration: InputDecoration(
                        hintText: 'Enter title',
                        labelText: 'Title'
                    ),
                  ),
                  TextField(
                    controller: _description,
                    decoration: InputDecoration(
                        hintText: 'Enter description',
                        labelText: 'Description'
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  _showPopupMenuButton(){
    return PopupMenuButton<VisibilityFilter>(
      icon: Icon(Icons.filter_list),
      onSelected: (VisibilityFilter result) {
        todos.changeFilter(result);
      },
      itemBuilder: (BuildContext context){
        return <PopupMenuEntry<VisibilityFilter>>[
          const PopupMenuItem<VisibilityFilter>(
            value: VisibilityFilter.all,
            child: Text('get all'),
          ),
          const PopupMenuItem<VisibilityFilter>(
            value: VisibilityFilter.pending,
            child: Text('get pending'),
          ),
          const PopupMenuItem<VisibilityFilter>(
            value: VisibilityFilter.completed,
            child: Text('get completed'),
          ),
        ];
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final test = todos.visibleTodos;
    return MaterialApp(
      title: 'Todo App',
      home:Scaffold(
        backgroundColor: Colors.deepPurple[600],
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/note.jpg',fit: BoxFit.fill,),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Text('Todo App',style: TextStyle(
                  color: Colors.limeAccent,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
              )),
            ),
            Observer(
              builder:(context) =>
                  Positioned(
                    width: 200.0,
                    top: 90,
                    child:Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Text('Fillter todo:',style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.bold,color: Colors.deepOrangeAccent ),),
                            _showPopupMenuButton()
                          ],
                        ),
                        Row(
                          children: [
                            Text('Current fillter:',style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.bold,color: Colors.deepOrangeAccent ),),
                            Text('${todos.filterName}',style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ],
                    ),
              ),
            ),
            DraggableScrollableSheet(
                maxChildSize: 0.85,
                builder: (BuildContext context,ScrollController scrollController){
                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
                      ),
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Observer(
                            builder: (context)=>
                                ListView.builder(
                                  itemBuilder: (context,index){
                                    final check = (todos.visibleTodos[index].done ==1) ? true : false;
                                    return ListTile(
                                      leading: IconButton(icon: Icon(Icons.edit),onPressed: (){
                                        _showFormDialogAddTodo(context, todos.todos[index].id);
                                      }),
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                  child: Text('${todos.visibleTodos[index].id}',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold),),
                                                ),
                                                Text('${todos.visibleTodos[index].title}',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold),),
                                                Checkbox(
                                                  value:check,
                                                  onChanged: (bool value){
                                                    this.setState(() {
                                                      todos.changeStatus(todos.visibleTodos[index]);
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                          ),

                                          IconButton(icon: Icon(Icons.delete,color: Colors.redAccent,),onPressed: (){
                                            todos.deleteTodo(todos.visibleTodos[index]);
                                          })
                                        ],
                                      ),
                                      subtitle: Text('${todos.visibleTodos[index].description}',style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold)),
                                    );
                                  },
                                  controller: scrollController,
                                  itemCount: todos.visibleTodos.length,
                                ),
                          ),
                          Positioned(
                            top: -20,
                            right: 30,
                            child: FloatingActionButton(
                              onPressed: (){
                                _showFormDialogAddTodo(context,0);
                              },
                              child: Icon(Icons.add,color: Colors.white),
                              backgroundColor: Colors.pinkAccent,
                            ),
                          ),
                        ],
                      )
                  );
                }
            ),
          ],
        ),
      ) ,
    );
  }
}




