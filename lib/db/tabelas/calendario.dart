final String tableCalendario = 'calendarioapp';

class CalendarioFields {
  static final String id = '_id';
  static final String alarme = 'alarme';
  static final String registroData = 'registroData';
}

class Calendario {
  final int? id;
  final bool alarme;
  final DateTime registroData;

  const Calendario({
    this.id,
    required this.alarme,
    required this.registroData,
  });
}
