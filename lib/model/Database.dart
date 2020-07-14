/*O database Localmente foi adicionado para demonstrar o manuseio com um banco de dados */

import 'package:path/path.dart';
import 'package:rango_time_app/model/Usuario.dart';
import 'package:sqflite/sqflite.dart';



Future<Database> CreateDabase() async {
  final String path = join(await getDatabasesPath(), 'RangoTime.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(RangoDao.tablesql);
    },
    version: 1,
  );
}

class RangoDao {
  static const String tablesql = "CREATE TABLE $tablename("
      "${_id} INTEGER PRIMARY KEY, "
      "${_email} TEXT, "
      "${_senha} TEXT,"
      "${_endereco} TEXT,"
      "${_uf} TEXT,"
      "${_cidade} TEXT,"
      "${_nome} TEXT"
      ") ";
  static const String tablename = "usuarios";
  static const String _id = "id";
  static const String _email = "email";
  static const String _senha = "senha";
  static const String _endereco = "endereco";
  static const String _uf = "uf";
  static const String _cidade = "cidade";
  static const String _nome = "nome";

  Future<int> Registra(Usuario item) async {
    final Database db = await CreateDabase();
    Map<String, dynamic> Mapitem = ToMap(item);
    return db.insert(tablename, Mapitem);
  }

  Map<String, dynamic> ToMap(Usuario item) {
    final Map<String, dynamic> Mapitem = Map();
    Mapitem[_email] = item.email;
    Mapitem[_senha] = item.senha;
    Mapitem[_endereco] = item.endereco;
    Mapitem[_uf] = item.uf;
    Mapitem[_cidade] = item.cidade;
    Mapitem[_nome] = item.nome;
    return Mapitem;
  }

  Future<List<Usuario>> Pesquisa() async {
    final Database db = await CreateDabase();
    final List<Map<String, dynamic>> result = await db.query(tablename);
    List<Usuario> itemlistado = ToList(result);
    return itemlistado;
  }

  List<Usuario> ToList(List<Map<String, dynamic>> result) {
    final List<Usuario> itemlistado = List();
    for (Map<String, dynamic> row in result) {
      final Usuario item = Usuario(row[_email],row[_senha],row[_endereco],row[_uf],row[_cidade],row[_nome]);
      itemlistado.add(item);
    }
    return itemlistado;
  }
}
