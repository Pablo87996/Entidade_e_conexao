import 'package:flutter/material.dart';
import 'package:primeiro_app/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:primeiro_app/app/domain/entities/contact.dart';
import 'package:primeiro_app/app/my_app.dart';

class ContactList extends StatelessWidget {
  final lista = [
    {'nome':'Coruja', 'telefone':'(01) 6001', 'avatar':'https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_960_720.jpg'},
    {'nome':'Fox', 'telefone':'(01) 6023', 'avatar':'https://cdn.pixabay.com/photo/2016/12/05/11/39/fox-1883658_960_720.jpg'},
    {'nome':'Lion', 'telefone':'(04) 6010', 'avatar':'https://cdn.pixabay.com/photo/2017/10/25/16/54/african-lion-2888519_960_720.jpg'},
  ];

Future<List<Contact>> buscar()async {
  return ContactDAOImpl().find();
}

  @override 
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          List<Contact> lista = futuro.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de contatos'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                  },
                )
              ],
            ),
            body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i){
                var contato = lista[i];
                var avatar = CircleAvatar(backgroundImage: NetworkImage(contato.urlAvatar),);
                return ListTile(
                  leading: avatar,
                  title: Text(contato.nome),
                  subtitle: Text(contato.telefone),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed: null,),
                        IconButton(icon: Icon(Icons.delete), onPressed: null,)
                      ],
                      ),
                  ),
                  
                );
              },
            ),      
          );
        }else{
          return Scaffold();
        }
      },
    ); 
  }
}