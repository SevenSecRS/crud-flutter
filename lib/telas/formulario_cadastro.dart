import 'package:crudteste/modelos/usuario.dart';
import 'package:crudteste/providers/usuarios.dart';
import 'package:crudteste/rotas/rotas_app.dart';
import 'package:crudteste/telas/lista_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'login.dart';



var maskCPF = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
var maskRG = new MaskTextInputFormatter(mask: '##.###.###-#', filter: { "#": RegExp(r'[0-9]') });
var maskTEL = new MaskTextInputFormatter(mask: '(##) ####-####', filter: { "#": RegExp(r'[0-9]') });
var maskCEP = new MaskTextInputFormatter(mask: '#####-###', filter: { "#": RegExp(r'[0-9]') });
var maskDATA = new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });

 // -> "1234-5678"



class FormularioCadastro extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};
  void _loadFormData(Usuario usuario)
  { if(usuario != null) {
    _formData['id'] = usuario.id;
    _formData['nome'] = usuario.nome;
    _formData['cpf'] = usuario.cpf;
    _formData['rg'] = usuario.rg;
    _formData['telefone'] = usuario.telefone;
    _formData['data_cadastro'] = usuario.data_cadastro;
    _formData['cep'] = usuario.cep;
    _formData['estado'] = usuario.estado;
    _formData['cidade'] = usuario.cidade;
    _formData['rua'] = usuario.rua;
    _formData['numero'] = usuario.numero;
    _formData['setor'] = usuario.setor;
    _formData['email'] = usuario.email;
    _formData['login'] = usuario.login;
    _formData['senha'] = usuario.senha;
    _formData['avatar'] = usuario.avatarUrl;
  }
  }



  @override
  Widget build(BuildContext context) {




    final Usuario usuario = ModalRoute.of(context).settings.arguments;
    _loadFormData(usuario);



    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if(isValid) {
                _form.currentState.save();
                Provider.of<Usuarios>(context, listen: false).put(Usuario(

                  nome: _formData['nome'],
                  cpf: _formData['cpf'],
                  rg: _formData['rg'],
                  telefone: _formData['telefone'],
                  data_cadastro: _formData['data_Cadastro'],
                  cep: _formData['cep'],
                  estado: _formData['estado'],
                  cidade: _formData['cidade'],
                  rua: _formData['rua'],
                  numero: _formData['numero'],
                  setor: _formData['setor'],
                  email: _formData['email'],
                  login: _formData['login'],
                  senha: _formData['senha'],
                  avatarUrl: _formData['avatarUrl'],
                  id: _formData['id'],

                ),
                );
                Navigator.of(context).pop();
              }

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
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListaUsuario()));
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
      body: Padding(padding: EdgeInsets.all(1),
      child: Form(
        key: _form,
          child: ListView(
      children: <Widget>[

      // Nome OBRIGATÓRIO

      ListTile(
        leading: const Icon(
        Icons.person,
      ),
          title: TextFormField(
            initialValue: _formData['nome'],
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                  hintText: "Digite seu nome", labelText: "Nome"),
             validator: (value){
              if(value.trim().length <3) {
                  return 'O campo deve ter no minimo 3 caracteres';
                }
                return null;
             },
              onSaved: (value) => _formData['nome'] = value,
          ),


      ),  ListTile(
              leading: const Icon(
                Icons.keyboard_hide,
              ),
              title: TextFormField(
                
                  initialValue: _formData['cpf'],

                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [maskCPF],
                  decoration: InputDecoration(
                      hintText: "000.000.000-00", labelText: "CPF"),
                  validator: (value){
                    if(value.trim().length <11) {
                      return 'O campo deve ter no minimo 3 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['cpf'] = value
              )
          ),
        ListTile(
            leading: const Icon(
              Icons.perm_identity,
            ),
            title: TextFormField(
                initialValue: _formData['rg'],
                inputFormatters: [maskRG],
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                hintText: "00.000.000-0", labelText: "RG"),
                onSaved: (value) => _formData['rg'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.phone,
            ),
            title: TextFormField(
                initialValue: _formData['telefone'],
                inputFormatters: [maskTEL],
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                    hintText: "(00) 0000-0000", labelText: "Telefone"),
                onSaved: (value) => _formData['telefone'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.calendar_today,
            ),
            title: TextFormField(
                initialValue: _formData['data_cadastro'],
                inputFormatters: [maskDATA],
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                    hintText: "10/10/2010", labelText: "Data Cadastro"),
                onSaved: (value) => _formData['data_cadastro'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: TextFormField(
                initialValue: _formData['cep'],
                inputFormatters: [maskCEP],
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                    hintText: "00000-000", labelText: "CEP"),
                onSaved: (value) => _formData['cep'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: TextFormField(
                initialValue: _formData['estado'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Digite seu Estado", labelText: "Estado"),
                validator: (value){
                  if(value.trim().length <2) {
                    return 'O campo deve ter no minimo 2 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['estado'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: TextFormField(
                initialValue: _formData['cidade'],
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                    hintText: "Digite sua Cidade", labelText: "Cidade"),
                validator: (value){
                  if(value.trim().length <5) {
                    return 'O campo deve ter no minimo 5 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['cidade'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: TextFormField(
                initialValue: _formData['rua'],
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                    hintText: "Digite seu Rua", labelText: "Rua"),
                validator: (value){
                  if(value.trim().length <1) {
                    return 'O campo deve ter no minimo 1 caracterer';
                  }
                  return null;
                },
                onSaved: (value) => _formData['rua'] = value
            )
        ),
        ListTile(
            leading: const Icon(
                Icons.home,
            ),
            title: TextFormField(
                initialValue: _formData['numero'],
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                    hintText: "Digite o numero da casa", labelText: "Numero da Casa"),
                validator: (value){
                  if(value.trim().length <1) {
                    return 'O campo deve ter no minimo 1 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['numero'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.work,
            ),
            title: TextFormField(
                initialValue: _formData['setor'],
                decoration: new InputDecoration(
                    hintText: "Digite seu setor de trabalho", labelText: "setor"),
                onSaved: (value) => _formData['setor'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.email,
            ),
            title: TextFormField(
                initialValue: _formData['email'],
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                    hintText: "exemplo@exemplo.com.br", labelText: "email"),
                onSaved: (value) => _formData['email'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: TextFormField(
                initialValue: _formData['login'],
                decoration: new InputDecoration(
                    hintText: "Crie seu Login", labelText: "login"),
                validator: (value){
                  if(value.trim().length <3) {
                    return 'O campo deve ter no minimo 3 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['login'] = value
            )
        ),
        ListTile(
            leading: const Icon(
              Icons.keyboard,
            ),
            title: TextFormField(
                initialValue: _formData['senha'],
                decoration: new InputDecoration(
                    hintText: "Crie sua Senha", labelText: "Senha"),
                obscureText: true,
                validator: (value){
                  if(value.trim().length <8) {
                    return 'O campo deve ter no minimo 8 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['senha'] = value
            )
        ),

          ],
          ),
      )
      )
      );



}}
