// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoList.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoList on TodoListBase, Store {
  final _$todosAtom = Atom(name: 'TodoListBase.todos');

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$filterAtom = Atom(name: 'TodoListBase.filter');

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$currentDescriptionAtom =
      Atom(name: 'TodoListBase.currentDescription');

  @override
  String get currentDescription {
    _$currentDescriptionAtom.reportRead();
    return super.currentDescription;
  }

  @override
  set currentDescription(String value) {
    _$currentDescriptionAtom.reportWrite(value, super.currentDescription, () {
      super.currentDescription = value;
    });
  }

  final _$TodoListBaseActionController = ActionController(name: 'TodoListBase');

  @override
  void addTodo(Todo instance) {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
        name: 'TodoListBase.addTodo');
    try {
      return super.addTodo(instance);
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTodo(int index) {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
        name: 'TodoListBase.deleteTodo');
    try {
      return super.deleteTodo(index);
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initTodo() {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
        name: 'TodoListBase.initTodo');
    try {
      return super.initTodo();
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Todo findTodo(int index) {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
        name: 'TodoListBase.findTodo');
    try {
      return super.findTodo(index);
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int findIdFinal() {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
        name: 'TodoListBase.findIdFinal');
    try {
      return super.findIdFinal();
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
filter: ${filter},
currentDescription: ${currentDescription}
    ''';
  }
}
