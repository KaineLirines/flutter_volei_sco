import 'package:flutter/material.dart';

class Times extends StatefulWidget {
	const Times({super.key});
  @override
 State<Times> createState() => _TimesState();
}


class _TimesState extends State<Times> {
  final TextEditingController _controllerTeams = TextEditingController();
  final TextEditingController _controllerPeoplePerTeam = TextEditingController();
  final TextEditingController _nomesPessoasDosTimes = TextEditingController();
  List<List<String>> _teams = [];

  void _drawTeams() {
    int numberOfTeams = int.tryParse(_controllerTeams.text) ?? 0;
    int peoplePerTeam = int.tryParse(_controllerPeoplePerTeam.text) ?? 0;

    if (numberOfTeams <= 0 || peoplePerTeam <= 0) {
      return;
    }

    List<String> participants = _nomesPessoasDosTimes.text.split(',').map((item) => item.trim()).toList();
    participants.shuffle();

    _teams.clear();
    for (int i = 0; i < numberOfTeams; i++) {
      List<String> team = [];
      for (int j = 0; j < peoplePerTeam; j++) {
        if (participants.isNotEmpty) {
          team.add(participants.removeLast());
        }
      }
      _teams.add(team);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sortear Times'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerTeams,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de time',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controllerPeoplePerTeam,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Pessoas por time',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nomesPessoasDosTimes,
              decoration: const InputDecoration(
                labelText: 'Nomes das pessoas dos times',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _drawTeams();
                },
              child: const Text('Sortear Time'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _teams.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _teams[index].map((member) {
                              return Text(member);
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Neste exemplo, o texto digitado é dividido em elementos usando split(','), que divide o texto em substrings em cada vírgula encontrada. O método map é utilizado para remover espaços em branco extras em cada elemento utilizando trim(). Os elementos resultantes são então armazenados em uma lista _items, que é usada para preencher um ListView.
// esconder a parte de preenchimento ao sortear
// validaçao no caso de valor < 2 na quantidades de times
// melhorar o layout
// aplicar a regra de negocio
// REGRA DE NEGOCIO
// Entrada quantidade de times
// Entrada pessoas por times
// Entrada nomes dos integrantes dos times por linha (provavelmente será lista)
// ao sortear exibir no visibility
// ao "sortear novamente" zerar os times