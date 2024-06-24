import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/button.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/modelos/dados_jogadores.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  State<Estatisticas> createState() => _EstatisticasState();
}

class _EstatisticasState extends State<Estatisticas> {
  
  // final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();

  void adicionarJogador() {
    setState(() {
      for (int id = 0; id >= 0; id++) {
        id++;
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.azulMaisEscuro,
      appBar: AppBar(
        title: const Text("Estatíticas"),
      ),
      body: Column(
        children: [
          
          ElevatedButton.icon(
            onPressed: () {
              adicionarJogador();
            },
            style: buttonStatistics,
            icon: const Icon(Icons.add),
            label: const Text("Adicionar jogador"),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text("Jogador"),
            ],
          ),
        ],
      ),
    );
  }
}
// Criar aba de partida jogada
// Criar dados/estatíticas dos jogadores
// Inserir dados do jogador
// Inserir valores do jogador
