import "package:flutter/material.dart";

    class Usuario {
      final String id;
      final String nome;
      final  String cpf;
      final  String rg;
      final  String telefone;
      final  String data_cadastro;
      final  String cep;
      final  String estado; //webservice viacep
      final  String cidade; //webservice viacep
      final  String rua; //webservice viacep
      final  String numero; //numero manual
      final  String setor;
      final  String login;
      final  String senha;
      final String email;
      final String avatarUrl;

      const Usuario({
        this.id,
        this.avatarUrl,
        this.rg,
        this.telefone,
        this.data_cadastro,
        this.cep,
        this.setor,
        @required this.nome,
        @required this.email,
        @required this.cpf,
        @required this.estado,
        @required this.cidade,
        @required this.rua,
        @required this.numero,
        @required this.login,
        @required this.senha,

    });
    }