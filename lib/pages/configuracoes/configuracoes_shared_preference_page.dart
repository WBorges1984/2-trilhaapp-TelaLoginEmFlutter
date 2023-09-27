import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage_servise.dart';

class ConfiguracoesSharedPreferencePage extends StatefulWidget {
  const ConfiguracoesSharedPreferencePage({super.key});

  @override
  State<ConfiguracoesSharedPreferencePage> createState() =>
      _ConfiguracoesSharedPreferencePageState();
}

class _ConfiguracoesSharedPreferencePageState
    extends State<ConfiguracoesSharedPreferencePage> {
  AppStorageService storage = AppStorageService();
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberPushNotification = false;
  bool temaEscuro = false;

  @override
  void initState() {
    // TODO: implement initState
    carregarDados();
  }

  showAlertDialog() {
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
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    receberPushNotification =
        await storage.getConfiguracoesReceberNotificacoes();
    temaEscuro = await storage.getConfiguracoesModoEscuro();
    alturaController.text = (await storage.getConfiguracoesAltura()).toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Configurações")),
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
                    value: receberPushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        receberPushNotification = !receberPushNotification;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Tema Escuro"),
                    value: temaEscuro,
                    onChanged: (bool value) {
                      setState(() {
                        temaEscuro = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();

                        await storage.setConfiguracoesAltura(
                            double.parse(alturaController.text));

                        await storage.setConfiguracoesNomeUsuario(
                            nomeUsuarioController.text);
                        await storage.setConfiguracoesReceberNotificacoes(
                            receberPushNotification);
                        await storage.setConfiguracoesModoEscuro(temaEscuro);
                        Navigator.pop(context);
                      },
                      child: Text("Salvar")),
                )
              ],
            ))));
  }
}
