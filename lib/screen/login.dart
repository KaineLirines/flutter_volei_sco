import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/meu_snackbar.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/componentes/decoracao_campo_autenticacao.dart';
import 'package:flutter_volei_sco/screen/homepage.dart';
import 'package:flutter_volei_sco/servicos/autenticacao_servico.dart';

// adicionar fonte;
// Fazer validação e-mail e senha;
// Verificar vídeo com o firebase;
// Melhorar Layout do login;
// Ver opção de animação ao logar;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  final AutenticacaoServico _autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.branco,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/bola_transparente.png",
                    height: 128,
                  ),
                  const Text(
                    "VoleiSco",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: getAuthenticationInputDecoration("E-mail"),
                    validator: (String? value) {
                      if (value == null) {
                        return "O e-mail não pode ser vazio";
                      }
                      if (value.length < 5) {
                        return "O e-mail é muito curto";
                      }
                      if (!value.contains("@")) {
                        return "O e-mail não é válido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _senhaController,
                    decoration: getAuthenticationInputDecoration("Senha"),
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null) {
                        return "A senha não pode ser vazia";
                      }
                      if (value.length < 5) {
                        return "A senha é muito curta";
                      }
                      return null;
                    },
                  ),
                  Visibility(
                    visible: !queroEntrar,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: getAuthenticationInputDecoration(
                              "Confirme a senha"),
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null) {
                              return "A Confirmação de senha não pode ser vazio";
                            }
                            if (value.length < 5) {
                              return "A Confirmação de senha é muito curta";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _nomeController,
                          decoration: getAuthenticationInputDecoration("Nome"),
                          validator: (String? value) {
                            if (value == null) {
                              return "O nome não pode ser vazio";
                            }
                            if (value.length < 5) {
                              return "O nome é muito curto";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MinhasCores.azulMaisEscuro,
                    ),
                    onPressed: () {
                      botaoPrincipalClicado();
                    },
                    child: Text(
                      (queroEntrar) ? "Entrar" : "Cadastrar",
                      style: const TextStyle(color: MinhasCores.branco),
                    ),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        queroEntrar = !queroEntrar;
                      });
                    },
                    child: Text(
                      (queroEntrar)
                          ? "Ainda não tem uma conta ? Cadastre-se"
                          : "Já tem uma conta? Entre!",
                      style: const TextStyle(color: MinhasCores.azulMaisEscuro),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  botaoPrincipalClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;
    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada validada");
        _autenServico.logarUsuarios(email: email, senha: senha).then(
          (String? erro) {
            if (erro != null) {
              mostrarSnackBar(context: context, texto: erro);
            }
          },
        );
      } else {
        print("Cadastro validado");
        print("${_emailController}, ${_senhaController}, ${_nomeController} ");
        _autenServico
            .cadastrarUsuario(email: email, senha: senha, nome: nome)
            .then(
          (String? erro) {
            if (erro != null) {
              mostrarSnackBar(context: context, texto: erro);
            } else {
              mostrarSnackBar(
                  context: context,
                  texto: "Cadastro efetuado com sucesso",
                  isErro: false);
            }
          },
        );
      }
    } else {
      print("Form inválido");
    }
  }
}
