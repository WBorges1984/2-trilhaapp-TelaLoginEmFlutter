import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  const DadosCadastraisHivePage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisHivePage> createState() =>
      _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascimentoController =
      TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];

  bool salvando = false;

  @override
  void initState() {
    // TODO: implement initState
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();

    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(
        DropdownMenuItem(
          child: Text(i.toString()),
          value: i,
        ),
      );
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(texto: "Nome:"),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: "Data de Nascimento:"),
                  TextField(
                      controller: dataNascimentoController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000, 1, 1),
                            firstDate: DateTime(1900, 1, 1),
                            lastDate: DateTime(2023, 12, 31));
                        if (data != null) {
                          dataNascimentoController.text = data.toString();
                          dadosCadastraisModel.dataNascimento = data;
                        }
                      }),
                  TextLabel(texto: "Nível de  Experiência"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            title: Text(nivel.toString()),
                            selected:
                                dadosCadastraisModel.nivelExperiencia == nivel,
                            value: nivel.toString(),
                            groupValue: dadosCadastraisModel.nivelExperiencia,
                            onChanged: (value) {
                              setState(() {
                                dadosCadastraisModel.nivelExperiencia =
                                    value.toString();
                                //print(value);
                              });
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Linguagens preferidas"),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            title: Text(linguagem),
                            value: dadosCadastraisModel.linguagens
                                .contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  dadosCadastraisModel.linguagens
                                      .add(linguagem);
                                });
                              } else {
                                setState(() {
                                  dadosCadastraisModel.linguagens
                                      .remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  TextLabel(texto: "Tempo de Experiência"),
                  DropdownButton(
                      value: dadosCadastraisModel.tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.tempoExperiencia =
                              int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretanção Salarial R\$ ${dadosCadastraisModel.salario?.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: dadosCadastraisModel.salario ?? 0,
                      onChanged: (double value) {
                        setState(() {
                          dadosCadastraisModel.salario = value;
                        });
                      }),
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          salvando = false;
                        });

                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nome deve ser preenchido.")));
                          return;
                        }
                        if (dadosCadastraisModel.dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Data de nascimento inválida")));
                          return;
                        }
                        if (dadosCadastraisModel.nivelExperiencia == null ||
                            dadosCadastraisModel.nivelExperiencia!.trim() ==
                                "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nível deve ser selecionado")));
                          return;
                        }
                        if (dadosCadastraisModel.linguagens.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Desve selecionar ao menos uma linguagem")));
                          return;
                        }
                        if (dadosCadastraisModel.tempoExperiencia == null ||
                            dadosCadastraisModel.tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Experiência mínima de um ano")));
                          return;
                        }
                        if (dadosCadastraisModel.salario == null ||
                            dadosCadastraisModel.salario == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Pretenção salarial deve ser maior que zero")));
                          return;
                        }
                        dadosCadastraisModel.nome = nomeController.text;
                        dadosCadastraisRepository.salvar(dadosCadastraisModel);
                        setState(() {
                          salvando = true;
                        });

                        Future.delayed(Duration(seconds: 2), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvos com sucesso!!")));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
