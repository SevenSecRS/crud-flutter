

import 'package:crudteste/modelos/usuario.dart';
import 'package:crudteste/providers/usuarios.dart';
import 'package:crudteste/rotas/rotas_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlocoUsuario extends StatefulWidget {

  final Usuario usuario;

  const BlocoUsuario(this.usuario);

  @override
  _BlocoUsuarioState createState() => _BlocoUsuarioState();
}

class _BlocoUsuarioState extends State<BlocoUsuario> {
  @override
  Widget build(BuildContext context) {
    final avatar = widget.usuario.avatarUrl == null || widget.usuario.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(widget.usuario.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(widget.usuario.nome),
      subtitle: Text((widget.usuario.email)),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                    RotasApp.FORMULARIO_CADASTRO,
                    arguments: widget.usuario,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Usuário'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[FlatButton(
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },

                    ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () {
                          Provider.of<Usuarios>(context, listen: false).remove(widget.usuario);
                          Navigator.of(context).pop();
                        },

                      )
                    ],
                  )
                );

              },
            )
          ]
        )
      ),


    );
  }
}
