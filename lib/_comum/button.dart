import 'package:flutter/material.dart';
import 'package:flutter_volei_sco/_comum/minhas_cores.dart';

final ButtonStyle buttonStatistics = ElevatedButton.styleFrom(
  minimumSize: Size(357, 50),
  backgroundColor:  MinhasCores.azulMaisEscuro,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    )
  )
);