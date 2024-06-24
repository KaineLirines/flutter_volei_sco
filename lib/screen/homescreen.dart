import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/screen/estatisticas.dart';
import 'package:flutter_volei_sco/screen/noticias.dart';
import 'package:flutter_volei_sco/screen/placar.dart';
import 'times.dart';
import 'package:flutter_volei_sco/componentes/decoracao_campo_autenticacao.dart';

// Organizar layout da HomeScreen;
// Verificar guia e tutoriais;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MinhasCores.azulMaisEscuro,
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Placar();
                      },
                    ),
                  );
                },
                child: Text("Placar"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                      return const Times();
                    },
                  ),
                );
              }, 
                child: Text("Times"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                      return const Estatisticas();
                    },
                  ),
                );
              }, 
                child: Text("Estatísticas"),
              ),
            ],
          ),
        ),
    );
  }
}
