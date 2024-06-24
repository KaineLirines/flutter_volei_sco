import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';
import 'package:flutter_volei_sco/screen/estatisticas.dart';
import 'package:flutter_volei_sco/screen/homescreen.dart';
import 'package:flutter_volei_sco/screen/maisscreen.dart';
import 'package:flutter_volei_sco/screen/noticias.dart';
import 'package:flutter_volei_sco/screen/placar.dart';
import 'placar.dart';
import 'estatisticas.dart';
import 'times.dart';

// Mordenizar BottomNavigation;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.branco,
      body: PageView(
        controller: pc,
        children: [
          const HomeScreen(),
          const NoticiasPage(),
          const MaisScreen(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.chrome_reader_mode), label: 'Notícias'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Mais'),
          ],
          onTap: (pagina) {
            pc.animateToPage(pagina,
                duration: Duration(milliseconds: 400), curve: Curves.ease);
          }),
    );
  }
}
