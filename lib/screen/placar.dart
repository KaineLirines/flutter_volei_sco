import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/screen/homepage.dart';
import 'package:signals/signals_flutter.dart';


  final counterA = signal<int>(0);
  final counterB = signal<int>(0);
  final setA = signal<int>(0);
  final setB = signal<int>(0);

class Placar extends StatefulWidget {
  const Placar({super.key});

  @override
  State<Placar> createState() => _PlacarState();
}

class _PlacarState extends State<Placar> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _resetPontos() {
    counterA.value = 0;
    counterB.value = 0;
  }

  void _resetSet() {
    effect(() {
      setA.value = 0;
      setB.value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.verdeTurquesa,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                child: ElevatedButton(
                  onPressed: () => setA.value++,
                  onLongPress: () => setA.value--,
                  child: Text(
                    '${setA.watch(context)}',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '${counterA.watch(context)}',
                style: const TextStyle(fontSize: 50),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => counterA.value++,
                  onLongPress: () => counterA.value--,
                  child: const Text("Adicionar/Remover")),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Homepage();
                        },
                      ),
                    );
                  },
                  child: const Text("Voltar Tela Inicial")),
              ElevatedButton(
                  onPressed: _resetSet, child: const Text("Resetar Set")),
              ElevatedButton(
                  onPressed: _resetPontos, child: const Text("Resetar Pontos")),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                child: ElevatedButton(
                  onPressed: () => setB.value++,
                  onLongPress: () => setB.value--,
                  child: Text(
                    '${setB.watch(context)}',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '${counterB.watch(context)}',
                style: const TextStyle(fontSize: 50),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => counterB.value++,
                  onLongPress: () => counterB.value--,
                  child: const Text("Adicionar/Remover"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
