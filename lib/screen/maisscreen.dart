import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';

// Adicionar Bottom Sheet no botão de Redes Sociais
// Adicionar Bottom sheet no botão da escolha do tema do app;

class MaisScreen extends StatefulWidget {
  const MaisScreen({super.key});

  @override
  State<MaisScreen> createState() => _MaisScreenState();
}

class _MaisScreenState extends State<MaisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mais', 
        style: (TextStyle(color: MinhasCores.branco)
        ),
        ),
        backgroundColor: MinhasCores.azulMarinho,
      ),
      backgroundColor: MinhasCores.azulMaisEscuro,
      body: Column(
        children: [
        ElevatedButton(
          onPressed: (){},
          child: const Text('Ajustes'),
          ),
        ],
      ),
    );
  }
}