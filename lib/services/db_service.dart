import 'dart:io';

import 'package:educative_software/models/chapter_model.dart';
import 'package:educative_software/services/chapter_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DBService {
  static Future<Database> _openDB() async {
    if (Platform.isAndroid) {
      return openDatabase(
        join(await getDatabasesPath(), 'route.db'),
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE chapter (id_chapter INTEGER PRIMARY KEY, name_chapter TEXT, activated BOOLEAN)");
        },
        version: 1,
      );
    } else {
      var db = databaseFactoryFfi;
      String dbpath = join(await getDatabasesPath(), 'testdb.db');
      return db.openDatabase(dbpath,
          options: OpenDatabaseOptions(
            version: 1,
            onCreate: (db, version) async {
              await db.execute(
                  "CREATE TABLE chapter (id_chapter INTEGER PRIMARY KEY, name_chapter TEXT, activated BOOL)");
            },
          ));
    }
  }

  static Future<void> initializeDB() async {
    if (await isDBEmpty()) {
      await insertChapters([
        "La Bandera de la Estrella Solitaria",
        "El Himno de Bayamo",
        "El Escudo de la Palma Real",
        "La Flor Mariposa",
        "El Tocororo",
        "La Palma Real"
      ]);
    }
  }

  static Future<bool> isDBEmpty() async {
    Database db = await _openDB();

    List<Map<String, dynamic>> escMap = await db.query("chapter");
    if (escMap.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<ChapterModel>> getChapters() async {
    Database db = await _openDB();

    return await ChapterService.getChapters(db);
  }

  static Future<ChapterModel> getChapterByID(int id) async {
    Database db = await _openDB();

    return await ChapterService.getChapterByID(db, id);
  }

  static Future<void> insertChapters(List<String> chapters) async {
    Database db = await _openDB();
    await ChapterService.insertChapters(db, chapters);
  }

  static Future<void> updateChapter(ChapterModel chapter) async {
    Database db = await _openDB();
    await ChapterService.updateChapter(db, chapter);
  }

  static Future<void> cleanProgress() async {
    Database db = await _openDB();
    await ChapterService.cleanProgress(db);
  }
}
