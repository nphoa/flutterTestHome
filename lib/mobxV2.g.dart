// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobxV2.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Contact on ContactBase, Store {
  Computed<String> _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??=
          Computed<String>(() => super.fullName, name: 'ContactBase.fullName'))
      .value;

  final _$firstNameAtom = Atom(name: 'ContactBase.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: 'ContactBase.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$ContactBaseActionController = ActionController(name: 'ContactBase');

  @override
  void addName(String firstName, String lastName) {
    final _$actionInfo =
        _$ContactBaseActionController.startAction(name: 'ContactBase.addName');
    try {
      return super.addName(firstName, lastName);
    } finally {
      _$ContactBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
fullName: ${fullName}
    ''';
  }
}
