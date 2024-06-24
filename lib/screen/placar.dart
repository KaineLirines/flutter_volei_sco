import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/screen/homepage.dart';

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

  int _counterA = 0;
  int _counterB = 0;
  int _setA = 0;
  int _setB = 0;

  void _resetPontos() {
    setState(() {
      _counterA = 0;
      _counterB = 0;
    });
  }

  void _resetSet() {
    setState(() {
      _setA = 0;
      _setB = 0;
    });
  }

  void _incrementCounterA() {
    setState(() {
      _counterA++;
    });
  }

  void _decrementCounterA() {
    setState(() {
      if (_counterA > 0) {
        _counterA--;
      } else {
        _counterA;
      }
    });
  }

  void _incrementsetA() {
    setState(() {
      _setA++;
    });
  }

  void _decrementsetA() {
    setState(() {
      if (_setA == 0) {
        _setA;
      } else {
        _setA--;
      }
    });
  }

  void _incrementCounterB() {
    setState(() {
      _counterB++;
    });
  }

  void _decrementCounterB() {
    setState(() {
      if (_counterB > 0) {
        _counterB--;
      } else {
        _counterB;
      }
    });
  }

  void _incrementsetB() {
    setState(() {
      _setB++;
    });
  }

  void _decrementsetB() {
    setState(() {
      if (_setB > 0) {
        _setB--;
      } else {
        _setB;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.verdeTurquesa,
      body: SingleChildScrollView(
        child: Center(
          child: Row(
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
                      onPressed: _incrementsetA,
                      onLongPress: _decrementsetA,
                      child: Text(
                        '$_setA',
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '$_counterA',
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: _incrementCounterA,
                      onLongPress: _decrementCounterA,
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
                      onPressed: _resetPontos,
                      child: const Text("Resetar Pontos")),
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
                      onPressed: _incrementsetB,
                      onLongPress: _decrementsetB,
                      child: Text(
                        '$_setB',
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '$_counterB',
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: _incrementCounterB,
                      onLongPress: _decrementCounterB,
                      child: const Text("Adicionar/Remover")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
