import 'package:flutter/material.dart';
import 'package:trilhaapp/model/configuracoes_model.dart';
import 'package:trilhaapp/repositories/configuracoes_repository.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    carregarDados();
  }

/*   showAlertDialog() {
    return AlertDialog(
        title: Text("Meu App"),
        content: Text("Favor informar uma altura válida!"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"))
        ]);
  } */

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();

    nomeUsuarioController.text = configuracoesModel.getNomeUsuario;
    alturaController.text = configuracoesModel.getAltura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Configurações Hive")),
            body: Container(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Nome Usuário"),
                    controller: nomeUsuarioController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Altura"),
                    controller: alturaController,
                  ),
                ),
                SwitchListTile(
                  title: const Text("Receber Notificações"),
                  onChanged: (bool value) {
                    setState(() {
                      configuracoesModel.setReceberNotificacoes = value;
                    });
                  },
                  value: configuracoesModel.getReceberNotificacoes,
                ),
                SwitchListTile(
                    title: const Text("Tema Escuro"),
                    value: configuracoesModel.getTemaEscuro,
                    onChanged: (bool value) {
                      setState(() {
                        configuracoesModel.setTemaEscuro = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();

                        configuracoesModel.setAltura =
                            double.parse(alturaController.text);

                        configuracoesModel.setNomeUsuario =
                            nomeUsuarioController.text;

                        configuracoesRepository.salvar(configuracoesModel);
                        Navigator.pop(context);
                      },
                      child: Text("Salvar")),
                )
              ],
            ))));
  }
}
