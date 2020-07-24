import 'package:crudteste/providers/usuarios.dart';
import 'package:crudteste/rotas/rotas_app.dart';
import 'package:crudteste/telas/formulario_cadastro.dart';
import 'package:crudteste/telas/lista_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
        ChangeNotifierProvider(
        create: (ctx) => Usuarios(),
        )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            RotasApp.HOME: (_) => ListaUsuario(),
            RotasApp.FORMULARIO_CADASTRO: (_) =>FormularioCadastro(),


          },
        ),
    );
  }
}

