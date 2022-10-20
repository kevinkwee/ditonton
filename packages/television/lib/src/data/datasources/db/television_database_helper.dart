import 'package:sqflite/sqflite.dart';

import '../../models/television_watchlist_model.dart';

class TelevisionDatabaseHelper {
  TelevisionDatabaseHelper._instance() {
    _databaseHelper = this;
  }

  static TelevisionDatabaseHelper? _databaseHelper;
  static Database? _database;
  static const String _tblWatchlist = 'watchlist';
  static const String _tblTvWatchlist = 'tvWatchlist';

  factory TelevisionDatabaseHelper() =>
      _databaseHelper ?? TelevisionDatabaseHelper._instance();

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tblTvWatchlist (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertWatchlist(
    TelevisionWatchlistModel televisionWatchlistModel,
  ) async {
    final db = await database;
    return await db!.insert(_tblTvWatchlist, televisionWatchlistModel.toJson());
  }

  Future<int> removeWatchlist(
    TelevisionWatchlistModel televisionWatchlistModel,
  ) async {
    final db = await database;
    return await db!.delete(
      _tblTvWatchlist,
      where: 'id = ?',
      whereArgs: [televisionWatchlistModel.id],
    );
  }

  Future<Map<String, dynamic>?> getTelevisionById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblTvWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getTelevisionWatchlist() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblTvWatchlist);

    return results;
  }
}
