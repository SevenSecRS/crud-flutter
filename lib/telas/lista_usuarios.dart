import 'package:crudteste/providers/usuarios.dart';
import 'package:crudteste/rotas/rotas_app.dart';
import 'package:crudteste/telas/formulario_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:crudteste/componentes/bloco_usuario.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class ListaUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Usuarios usuarios = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      RotasApp.FORMULARIO_CADASTRO
                  );
                },
      ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("exemplo@exemplo.com"),
              accountName: Text("Exemplo"),
              currentAccountPicture: Image.network('https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png'),
            ),


            ListTile(
              leading: Icon(Icons.person),
              title: Text("Login"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TelaLogin()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Consultar Usuário"),
              onTap: () {
              },
            ),
         ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Cadastrar Usuário"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FormularioCadastro()));
              },
            ),
          ],
        ),
      ),
          body: ListView.builder(
        itemCount: usuarios.count,
        itemBuilder: (ctx, i) => BlocoUsuario(usuarios.byIndex(i)),
    ),
    );
  }
}
