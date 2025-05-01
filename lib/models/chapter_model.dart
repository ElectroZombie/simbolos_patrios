class ChapterModel {
  int chapterID;
  String chapterName;
  bool activated;

  ChapterModel({
    required this.chapterID,
    required this.chapterName,
    required this.activated,
  });

  static ChapterModel nullChapter() {
    return ChapterModel(chapterID: 0, chapterName: "Waiting", activated: true);
  }

  Map<String, dynamic> toMap() {
    return {
      'id_chapter': chapterID,
      'name_chapter': chapterName,
      'activated': activated,
    };
  }
}
