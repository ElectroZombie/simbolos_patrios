import 'package:flutter/material.dart';
import 'package:educative_software/models/chapter_model.dart';
import 'package:educative_software/services/db_service.dart';

class ChapterProvider extends ChangeNotifier {
  List<ChapterModel> chapters = [ChapterModel.nullChapter()];

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

  cleanProgress() async {
    for (int i = 2; i < chapters.length; i++) {
      chapters[i].activated = false;
    }
    DBService.cleanProgress();
    notifyListeners();
  }

  loadChapters() async {
    if (chapters.length > 1) {
      return;
    }
    List<ChapterModel> chaptersDB = await DBService.getChapters();
    chapters =
        chapters + List.generate(chaptersDB.length, (i) => chaptersDB[i]);
  }
}
