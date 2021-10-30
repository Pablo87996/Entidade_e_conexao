import 'package:primeiro_app/app/domain/entities/contact.dart';

abstract class ContactDAO{
  save(Contact contact);

  remove(dynamic id);

  Future<List<Contact>>find();

}