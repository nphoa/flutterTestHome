import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp2/Model/Todo.dart';
import 'package:flutterapp2/TodoList.dart';
class TodoApp extends StatelessWidget {
  final todos = TodoList();

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
                         Todo instance = Todo(id: 0,title: _title.text,description: _description.text);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        home:Scaffold(
          backgroundColor: Colors.deepPurple[600],
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(

                child: Image.asset('assets/todo2.jpg',fit: BoxFit.fill,),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: Text('Todo',style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
                )),
              ),
              DraggableScrollableSheet(
                maxChildSize: 0.85,
                builder: (BuildContext context,ScrollController scrollController){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
                    ),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Observer(
                          builder: (context)=>
                              ListView.builder(
                                itemBuilder: (context,index){
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
                                                child: Text('${todos.todos[index].id}',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold),),
                                              ),
                                              Text('${todos.todos[index].title}',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        ),

                                        IconButton(icon: Icon(Icons.delete,color: Colors.redAccent,),onPressed: (){
                                            todos.deleteTodo(index);
                                        })
                                      ],
                                    ),
                                    subtitle: Text('${todos.todos[index].description}',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold)),
                                  );
                                },
                                controller: scrollController,
                                itemCount: todos.todos.length,
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
                        )
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
