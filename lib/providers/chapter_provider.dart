import 'package:flutter/material.dart';
import 'package:educative_software/models/chapter_model.dart';
import 'package:educative_software/services/db_service.dart';

class ChapterProvider extends ChangeNotifier {
  List<ChapterModel> chapters = [];

  List<ChapterModel> getChapters() => chapters;

  ChapterModel getChapter(int pos) => chapters[pos];

  setValues() async {
    await loadChapters();
    notifyListeners();
  }

  activateNextChapter(int pos) async {
    if (pos == chapters.length) {
      return;
    }
    chapters[pos].activated = true;

    DBService.updateChapter(await DBService.getChapterByID(pos));

    notifyListeners();
  }

  cleanProgress() {
    for (int i = 0; i < chapters.length; i++) {
      chapters[i].activated = false;
    }
    notifyListeners();
  }

  loadChapters() async {
    List<ChapterModel> chapters = await DBService.getChapters();
    this.chapters = List.generate(chapters.length, (i) => chapters[i]);
  }
}
