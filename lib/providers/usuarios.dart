

import 'dart:math';

import 'package:crudteste/database/modelo_usuarios.dart';
import 'package:crudteste/modelos/usuario.dart';
import 'package:flutter/cupertino.dart';

class Usuarios with ChangeNotifier {
 final Map<String, Usuario> _items = {...MODELO_USUARIOS};

 List<Usuario> get all {
   return [..._items.values];
 }

 int get count {
   return _items.length;

 }

 Usuario byIndex(int i) {
   return _items.values.elementAt(i);
 }

 void put(Usuario usuario) {
   if(usuario == null) {
     return;
   }

   if(usuario.id != null &&
       usuario.id.trim().isNotEmpty &&
       _items.containsKey(usuario.id)) {
     _items.update(usuario.id, (_) =>
         Usuario(
           id: usuario.id,
           nome: usuario.nome,
           cpf: usuario.cpf,
           rg: usuario.rg,
           telefone: usuario.telefone,
           data_cadastro: usuario.data_cadastro,
           cep: usuario.cep,
           estado: usuario.estado,
           cidade: usuario.cidade,
           rua: usuario.rua,
           numero: usuario.numero,
           setor: usuario.setor,
           email: usuario.email,
           login: usuario.login,
           avatarUrl: usuario.avatarUrl,
           senha: usuario.senha,
         ));
   } else {

     final id = Random().nextDouble().toString();

     _items.putIfAbsent(id,
       () => Usuario(
       id: id,
         nome: usuario.nome,
         cpf: usuario.cpf,
         rg: usuario.rg,
         telefone: usuario.telefone,
         data_cadastro: usuario.data_cadastro,
         cep: usuario.cep,
         estado: usuario.estado,
         cidade: usuario.cidade,
         rua: usuario.rua,
         numero: usuario.numero,
         setor: usuario.setor,
         email: usuario.email,
         login: usuario.login,
         avatarUrl: usuario.avatarUrl,
         senha: usuario.senha,
     ),
     );

   }
   notifyListeners();
 }

 void remove(Usuario usuario) {
   if (usuario != null && usuario.id != null) {
     _items.remove(usuario.id);
     notifyListeners();
   }
 }
}