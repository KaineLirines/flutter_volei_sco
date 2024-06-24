import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/componentes/decoracao_campo_autenticacao.dart';
import 'package:flutter_volei_sco/screen/homepage.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key:_formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/bola_transparente.png", 
                  height: 128,
                  ),
                  const Text("VoleiSco",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 48,
                     fontWeight: FontWeight.bold,
                      color: Colors.white
                      ),
                    ),
                   const SizedBox(
                    height: 16,
                    ),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration("E-mail"),
                    validator: (String? value) {
                      if (value == null){
                        return "O e-mail não pode ser vazio";
                      }
                      if (value.length < 5 ){
                        return "O e-mail é muito curto";
                      }
                      if (!value.contains("@")){
                        return "O e-mail não é válido";
                      } else {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const Homepage(),
                          ),
                          );
                        }
                    },
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration("Senha"),
                    obscureText: true,
                    validator: (String? value){
                      if (value == null){
                        return "A senha não pode ser vazia";
                      }
                      if (value.length < 5 ){
                        return "A senha é muito curta";
                      }
                      return null;
                    },
                  ),
                  Visibility(
                    visible: !queroEntrar, 
                    child: Column(
                      children: [
                        const SizedBox(height: 16,),
                        TextFormField(
                          decoration: getAuthenticationInputDecoration("Confirme a senha"),
                        obscureText: true,
                          validator: (String? value){
                            if (value == null){
                              return "A Confirmação de senha não pode ser vazio";
                            }
                            if (value.length < 5 ){
                              return "A Confirmação de senha é muito curta";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          decoration: getAuthenticationInputDecoration("Nome"),
                          validator: (String? value){
                            if (value == null){
                              return "O nome não pode ser vazio";
                            }
                            if (value.length < 5 ){
                              return "O nome é muito curto";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: (){
                      botaoPrincipalClicado();
                    },
                    child: Text((queroEntrar) ? "Entrar" : "Cadastrar"),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        queroEntrar = !queroEntrar;
                      });
                    },
                     child:  Text((queroEntrar) ? "Ainda não tem uma conta ? Cadastre-se" : "Já tem uma conta? Entre!"
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

  botaoPrincipalClicado (){
    if (_formKey.currentState!.validate()){
      print("form válido");
    } else{
    }
  }
}

