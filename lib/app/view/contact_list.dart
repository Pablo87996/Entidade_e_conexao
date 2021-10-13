import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primeiro_app/app/domain/entities/contact.dart';
import 'package:primeiro_app/app/my_app.dart';
import 'package:primeiro_app/app/view/contact_list_back.dart';

class ContactList extends StatelessWidget {
  /*final lista = [
    {
      'nome': 'Coruja',
      'telefone': '(01) 6001',
      'avatar':
          'https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_960_720.jpg'
    },
    {
      'nome': 'Fox',
      'telefone': '(01) 6023',
      'avatar':
          'https://cdn.pixabay.com/photo/2016/12/05/11/39/fox-1883658_960_720.jpg'
    },
    {
      'nome': 'Lion',
      'telefone': '(04) 6010',
      'avatar':
          'https://cdn.pixabay.com/photo/2017/10/25/16/54/african-lion-2888519_960_720.jpg'
    },
  ];*/
  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url){
    try{
      return CircleAvatar(backgroundImage: NetworkImage(url));
    }catch(e){
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
                Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
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
