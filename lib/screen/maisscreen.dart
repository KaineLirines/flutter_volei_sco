import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/servicos/autenticacao_servico.dart';

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
        title: const Text(
          'Mais',
          style: (TextStyle(color: MinhasCores.branco)),
        ),
        backgroundColor: MinhasCores.azulMarinho,
      ),
      backgroundColor: MinhasCores.azulMarinho,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MinhasCores.azulMarinhoClaro,
                minimumSize: const Size(350, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.settings,
                      size: 24.0,
                      color: MinhasCores.azulMarinho,
                    ),
                  ),
                  const SizedBox(
                    width: 82,
                  ),
                  const Text(
                    'Ajustes',
                    style: TextStyle(
                      color: MinhasCores.branco,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 400,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Close",
                            style: TextStyle(
                                color: MinhasCores.azulMaisEscuro,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MinhasCores.azulMarinhoClaro,
                minimumSize: const Size(350, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
              ),
              onPressed: () {
                AutenticacaoServico().deslogar();
              },
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, 
                      color: Colors.white),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.logout,
                      size: 24,
                      color: MinhasCores.azulMaisEscuro,
                    ),
                  ),
                  const SizedBox(
                    width: 82,
                  ),
                  const Text(
                    "Deslogar",
                    style: TextStyle(
                        color: MinhasCores.branco,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
