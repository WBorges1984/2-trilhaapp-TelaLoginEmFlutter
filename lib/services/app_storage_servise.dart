import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVES_DADOS_CADASTRAIS_NOME,
  CHAVES_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_NOME_USUARIO,
  CHAVE_ALTURA,
  CHAVE_RECEBER_NOTIFICACOES,
  CHAVE_MODO_ESCURO,
  CHAVE_NUMERO_ALEATORIO
}

class AppStorageService {
  /*GET E SET => NUMEROS ALEATORIOS */

  Future<void> setNumeroaAleatorios(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString(), value);
  }

  Future<int> getNumeroaAleatorios() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString());
  }

  /* CONFIGURAÇÕES  */

  /*GET E SET => NOME_USUARIO */
  Future<void> setConfiguracoesNomeUsuario(String value) async {
    await _setString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), value);
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }

  /*GET E SET => ALTURA */
  Future<void> setConfiguracoesAltura(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getConfiguracoesAltura() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }

  /*GET E SET => RECEBER_NOTIFICACOES */
  Future<void> setConfiguracoesReceberNotificacoes(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString(), value);
  }

  Future<bool> getConfiguracoesReceberNotificacoes() async {
    return _getBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString());
  }

  /*GET E SET => MODO ESCURO */
  Future<void> setConfiguracoesModoEscuro(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_MODO_ESCURO.toString(), value);
  }

  Future<bool> getConfiguracoesModoEscuro() async {
    return _getBool(STORAGE_CHAVES.CHAVE_MODO_ESCURO.toString());
  }

  /* CONFIGURAÇÕES  */

  /*GET E SET => NOME */
  Future<void> setDadosCadastriaisNome(String nome) async {
    await _setString(
        STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_NOME.toString());
  }

/*GET E SET => DATA NASCIMENTO */
  Future<void> setDadosCadastriaisDataNascimento(DateTime data) async {
    await _setString(
        STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(),
        data.toString());
  }

  Future<String> getDadosCadastraisDataNascimento() async {
    return _getString(
        STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

/*GET E SET => NIVEL EXPERIENCIA */
  Future<void> setDadosCadastriaisNivelExperiencia(String value) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(),
        value);
  }

  Future<String> getDadosCadastraisNivelExperiencia() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString());
  }

/*GET E SET => LINGUAGENS */
  Future<void> setDadosCadastriaisLinguagens(List<String> values) async {
    await _setStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(), values);
  }

  Future<List<String>> getDadosCadastraisLInguagens() async {
    return _getStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());
  }

  /*GET E SET => TEMPO EXPERIENCIA */

  Future<void> setDadosCadastriaisTempoExperiencia(int value) async {
    await _setInt(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(),
        value);
  }

  Future<int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  /*GET E SET => SALARIO */

  Future<void> setDadosCadastriaisSalatorio(double value) async {
    await _setDouble(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), value);
  }

  Future<double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }

/* *****FUNÇÕES GET E SET******* */

/* SET E GET STRING */
  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

/* SET E GET STRING LIST*/
  Future<void> _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  /* SET E GET INT */

  Future<void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  /* SET E GET DOUBLE */

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
  /* SET E GET BOOL */

  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
