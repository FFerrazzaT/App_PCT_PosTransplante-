final String tableSintomas = 'sintomas';

class SintomasFields {
  static final String id = '_id';
  static final String nomeSintoma = 'nomeSintoma';
  static final String possuiSintoma = 'possuiSintoma';
  static final String registroSintoma = 'registroSintoma';
}

class Sintoma {
  final int? id;
  final String nomeSintoma;
  final bool possuiSintoma;
  final DateTime registroSintoma;

  const Sintoma({
    this.id,
    required this.nomeSintoma,
    required this.possuiSintoma,
    required this.registroSintoma,
  });
}
