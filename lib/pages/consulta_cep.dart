import 'package:flutter/material.dart';
import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/repositories/viacep_repository.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  TextEditingController cepController = TextEditingController(text: "");
  var viacepModel = ViaCEPModel();
  var viacepRepository = ViaCEPRepository();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () async {}),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text("Consulta CEP",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              controller: cepController,
              onChanged: (String value) async {
                // var cep = value.trim().replaceAll('-', '');
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');

                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viacepModel = await viacepRepository.consultarCep(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(height: 50),
            Text(viacepModel.logradouro ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            Visibility(visible: loading, child: CircularProgressIndicator()),
            Text("${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ));
  }
}
