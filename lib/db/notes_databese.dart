import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_helptmo/db/tabelas/sintoma.dart';
import 'package:app_helptmo/db/tabelas/calendario.dart';
import 'package:app_helptmo/db/tabelas/identificacao.dart';
import 'package:app_helptmo/db/tabelas/medicacao.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("notes.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute(
        '''
    CREATE TABLE $tableSintomas (
      ${SintomasFields.id} $idType,
      ${SintomasFields.nomeSintoma} $textType,
      ${SintomasFields.possuiSintoma} $boolType,
      ${SintomasFields.registroSintoma} $textType
    ) ''');

    await db.execute(
        '''
    CREATE TABLE $tableMedicacao (
      ${MedicacaoFields.id} $idType,
      ${MedicacaoFields.nomeMedicacao} $textType,
      ${MedicacaoFields.utilizaMedicacao} $boolType,
      ${MedicacaoFields.registroMedicacao} $textType
    ) ''');

    await db.execute(
        '''
    CREATE TABLE $tableCalendario (
      ${CalendarioFields.id} $idType,
      ${CalendarioFields.alarme} $boolType,
      ${CalendarioFields.registroData} $textType
    ) ''');

    await db.execute(
        '''
    CREATE TABLE $tableIdentificacao (
      ${IdentificacaoFields.id} $idType,
      ${IdentificacaoFields.apelido} $textType
    ) ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
