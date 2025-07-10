import 'package:sqflite/sqflite.dart';

import '../models/chapter_model.dart';

class ChapterService {
  static Future<List<ChapterModel>> getChapters(Database db) async {
    List<Map<String, dynamic>> Q = await db.query('chapter');
    if (Q.isEmpty) {
      return [];
    }
    return List.generate(
        Q.length,
        (i) => ChapterModel(
            chapterID: Q[i]['id_chapter'],
            chapterName: Q[i]['name_chapter'],
            activated: Q[i]['activated'] == 0 ? true : false));
  }

  static Future<ChapterModel> getChapterByID(Database db, int id) async {
    List<Map<String, dynamic>> Q =
        await db.query('chapter', where: 'id_chapter = ?', whereArgs: [id]);
    if (Q.isEmpty) {
      return ChapterModel.nullChapter();
    } else {
      return ChapterModel(
          chapterID: Q[0]['id_chapter'],
          chapterName: Q[0]['name_chapter'],
          activated: Q[0]['activated'] == 0 ? true : false);
    }
  }

  static Future<void> insertChapters(
      Database db, List<String> chapterNames) async {
    for (int i = 1; i <= chapterNames.length; i++) {
      await db.insert('chapter', {
        'id_chapter': i,
        'name_chapter': chapterNames[i - 1],
        'activated': ((i == 1) ? 0 : 1)
      });
    }
  }

  static Future<void> updateChapter(Database db, ChapterModel chapter) async {
    await db.update('chapter', {'activated': 0},
        where: 'id_chapter = ?', whereArgs: [chapter.chapterID]);
  }

  static Future<void> cleanProgress(Database db) async {
    for (int i = 1; i < 3; i++) {
      await db.update('chapter', {'activated': 1},
          where: 'id_chapter = ?', whereArgs: [i]);
    }
  }
}
