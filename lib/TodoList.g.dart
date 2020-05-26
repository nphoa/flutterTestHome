// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoList.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoList on TodoListBase, Store {
  Computed<List<Todo>> _$pendingTodosComputed;

  @override
  List<Todo> get pendingTodos =>
      (_$pendingTodosComputed ??= Computed<List<Todo>>(() => super.pendingTodos,
              name: 'TodoListBase.pendingTodos'))
          .value;
  Computed<List<Todo>> _$completedTodosComputed;

  @override
  List<Todo> get completedTodos => (_$completedTodosComputed ??=
          Computed<List<Todo>>(() => super.completedTodos,
              name: 'TodoListBase.completedTodos'))
      .value;
  Computed<bool> _$hasPendingTodosComputed;

  @override
  bool get hasPendingTodos =>
      (_$hasPendingTodosComputed ??= Computed<bool>(() => super.hasPendingTodos,
              name: 'TodoListBase.hasPendingTodos'))
          .value;
  Computed<bool> _$hasCompletedTodosComputed;

  @override
  bool get hasCompletedTodos => (_$hasCompletedTodosComputed ??= Computed<bool>(
          () => super.hasCompletedTodos,
          name: 'TodoListBase.hasCompletedTodos'))
      .value;
  Computed<List<Todo>> _$visibleTodosComputed;

  @override
  List<Todo> get visibleTodos =>
      (_$visibleTodosComputed ??= Computed<List<Todo>>(() => super.visibleTodos,
              name: 'TodoListBase.visibleTodos'))
          .value;
  Computed<String> _$filterNameComputed;

  @override
  String get filterName =>
      (_$filterNameComputed ??= Computed<String>(() => super.filterName,
              name: 'TodoListBase.filterName'))
          .value;

  final _$todosAtom = Atom(name: 'TodoListBase.todos');

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
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

  final _$initTodoAsyncAction = AsyncAction('TodoListBase.initTodo');

  @override
  Future<void> initTodo() {
    return _$initTodoAsyncAction.run(() => super.initTodo());
  }

  final _$changeStatusAsyncAction = AsyncAction('TodoListBase.changeStatus');

  @override
  Future<void> changeStatus(Todo instance) {
    return _$changeStatusAsyncAction.run(() => super.changeStatus(instance));
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
  void deleteTodo(Todo instance) {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
        name: 'TodoListBase.deleteTodo');
    try {
      return super.deleteTodo(instance);
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
  void changeFilter(VisibilityFilter filter) {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
        name: 'TodoListBase.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
filter: ${filter},
currentDescription: ${currentDescription},
pendingTodos: ${pendingTodos},
completedTodos: ${completedTodos},
hasPendingTodos: ${hasPendingTodos},
hasCompletedTodos: ${hasCompletedTodos},
visibleTodos: ${visibleTodos},
filterName: ${filterName}
    ''';
  }
}
