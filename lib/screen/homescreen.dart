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
      backgroundColor: MinhasCores.branco,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 0, 0),
              child: Text(
                "Olá, Kaine",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MinhasCores.verdeTurquesaClaro,
                    minimumSize: Size(170, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        padding: EdgeInsets.all(8.0),
                        child:
                            Icon(Icons.score, color: MinhasCores.verdeTurquesa),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Placar',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MinhasCores.verdeTurquesaClaro,
                    minimumSize: Size(170, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Times();
                        },
                      ),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.person,
                            size: 24.0, color: MinhasCores.verdeTurquesa),
                      ),
                      Text(
                        'Times',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: const Text(
                "Acompanhe os seus jogadores",
                style: TextStyle(
                  color: MinhasCores.azulMaisEscuro,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MinhasCores.verdeTurquesaClaro,
                  minimumSize: Size(200, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Estatisticas();
                      },
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.percent,
                        size: 24.0,
                        color: MinhasCores.verdeTurquesa,
                      ),
                    ),
                    Text(
                      'Estatísticas',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: const Text(
                "Aprenda os fundamentos",
                style: TextStyle(
                    color: MinhasCores.azulMaisEscuro,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
