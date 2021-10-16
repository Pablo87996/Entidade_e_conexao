import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primeiro_app/app/domain/entities/contact.dart';
import 'package:primeiro_app/app/view/contact_list_back.dart';

class ContactList extends StatelessWidget {
  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url){
    if(Uri.tryParse(url).isAbsolute){
      return CircleAvatar(backgroundImage: NetworkImage(url));
    }else{
      return CircleAvatar(child: Icon(Icons.person));
    }
  }

  Widget iconEditButton(Function onPressed){
    return IconButton(icon: Icon(Icons.edit), color: Colors.deepPurple, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function remove){
    return IconButton(
      icon:Icon(Icons.delete), 
      color: Colors.red, 
      onPressed: (){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirma a exclusão?'),
            actions: [
              FlatButton(
                child: Text('Não'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Sim'),
                onPressed: remove,
              ),
            ],
          )

        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de contatos'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
            future: _back.list,
            builder: (context, futuro) {
              if (!futuro.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Contact> lista = futuro.data;
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var contato = lista[i];
                    return ListTile(
                      leading: circleAvatar(contato.urlAvatar),
                      title: Text(contato.nome),
                      subtitle: Text(contato.telefone),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            iconEditButton((){
                              _back.goToForm(context, contato);
                            }),
                            iconRemoveButton(context, (){
                              _back.remove(contato.id);
                              Navigator.of(context).pop();
                            })
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        }));
  }
}
