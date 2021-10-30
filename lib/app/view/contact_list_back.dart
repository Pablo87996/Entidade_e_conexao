import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:primeiro_app/app/domain/entities/contact.dart';
import 'package:primeiro_app/app/domain/services/contact_service.dart';

import '../my_app.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store{
  var _service = GetIt.I.get<ContactService>();

  //Lista de contatos
  Future<List<Contact>>list;

  //Método para atualizar a lista de contatos
  refreshList([dynamic value]){
    list = _service.find();
  }

  _ContactListBack(){
    refreshList();
  }

  //Método para chamar o formulario(salvar/alterar)
  goToForm(BuildContext context, [Contact contact]){
    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);
  }

  goToDetails(BuildContext context, Contact contact){
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS, arguments: contact);
  }

  //Excluir
  remove(dynamic id){
    _service.remove(id);
    refreshList();
  }
}
