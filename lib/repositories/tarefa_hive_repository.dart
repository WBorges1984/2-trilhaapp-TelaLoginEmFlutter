import 'package:hive/hive.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;
  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen("tarefasHiveModel")) {
      _box = Hive.box("tarefasHiveModel");
    } else {
      _box = await Hive.openBox("tarefasHiveModel");
    }

    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

  alterar(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.save();
  }

  excluir(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.delete();
  }

  List<TarefaHiveModel> obterDados(bool naoConlcuida) {
    if (naoConlcuida) {
      return _box.values
          .cast<TarefaHiveModel>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TarefaHiveModel>().toList();
  }
}