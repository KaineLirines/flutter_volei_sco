import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/modelos/dados_jogadores.dart';
import 'package:flutter_volei_sco/modelos/Player.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  State<Estatisticas> createState() => _EstatisticasState();
}

class _EstatisticasState extends State<Estatisticas> {
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();

  Future<void> addPlayer(String name, int score) {
    return firestore.collection('players').add({
      'name': name,
      'score': score,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.branco,
      appBar: AppBar(
        title: const Text("Estatíticas"),
      ),
       
    );
  }
}
// Criar aba de partida jogada
// Criar dados/estatíticas dos jogadores
// Inserir dados do jogador
// Inserir valores do jogador
