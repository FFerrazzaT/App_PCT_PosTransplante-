final String tableIdentificacao = 'identificacao';

class IdentificacaoFields {
  static final String id = '_id';
  static final String apelido = 'apelido';
}

class Identificacao {
  final int? id;
  final String apelido;

  const Identificacao({
    this.id,
    required this.apelido,
  });
}
