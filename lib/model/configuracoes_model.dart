class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0;
    _receberNotificacoes = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberNotificacoes,
      this._temaEscuro);

/* GET E SET */
  String get getNomeUsuario => _nomeUsuario;

  set setNomeUsuario(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  double get getAltura => _altura;

  set setAltura(double altura) {
    _altura = altura;
  }

  bool get getReceberNotificacoes => _receberNotificacoes;

  set setReceberNotificacoes(bool receberNotificacoes) {
    _receberNotificacoes = receberNotificacoes;
  }

  bool get getTemaEscuro => _temaEscuro;

  set setTemaEscuro(bool temaEscuro) {
    _temaEscuro = temaEscuro;
  }
}
