import '../utils/enum_types.dart';
import '../utils/tuple.dart';

class InfoSheetData {
  List<Tuple<String, String>> optionList;
  Map<LinkTypes, dynamic> linkMap;

  InfoSheetData(this.optionList, this.linkMap);
}
