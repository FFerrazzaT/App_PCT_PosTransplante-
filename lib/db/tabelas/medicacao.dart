final String tableMedicacao = 'medicacoes';

class MedicacaoFields {
  static final String id = '_id';
  static final String nomeMedicacao = 'nomeMedicacao';
  static final String utilizaMedicacao = 'utilizaMedicacao';
  static final String registroMedicacao = 'registroMedicacao';
}

class Medicacao {
  final int? id;
  final String nomeMedicacao;
  final bool utilizaMedicacao;
  final DateTime registroMedicacao;

  const Medicacao({
    this.id,
    required this.nomeMedicacao,
    required this.utilizaMedicacao,
    required this.registroMedicacao,
  });
}
