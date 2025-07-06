class ContextualIcon {
  bool activated;
  int? touchCount;
  int id;
  String text;

  ContextualIcon(
      {required this.id,
      required this.activated,
      required this.text,
      this.touchCount = 0});
}
