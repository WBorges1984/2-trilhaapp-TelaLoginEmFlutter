import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int numeroGerado = 0;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  late Box boxNumerosAleatorios;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen('BoxNumerosAleatorios')) {
      boxNumerosAleatorios = Hive.box("BoxNumerosAleatorios");
    } else {
      boxNumerosAleatorios = await Hive.openBox("BoxNumerosAleatorios");
    }
    numeroGerado = boxNumerosAleatorios.get('numeroGerado') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Hive")),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado.toString(),
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final store = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
            });
            boxNumerosAleatorios.put('numeroGerado', numeroGerado);

            var numero = store.getInt("numero_aleatorio");
            print(numero.toString());
          },
        ),
      ),
    );
  }
}
