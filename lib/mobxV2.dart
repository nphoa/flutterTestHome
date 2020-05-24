import 'package:mobx/mobx.dart';

part 'mobxV2.g.dart';
class Contact = ContactBase with _$Contact;
abstract class ContactBase with Store{

  @observable
  String firstName;

  @observable
  String lastName;

  @computed
  String get fullName => '$firstName,$lastName';

  @action
  void addName(String firstName,String lastName){
      this.firstName = firstName;
      this.lastName = lastName;
  }
}