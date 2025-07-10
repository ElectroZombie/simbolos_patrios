import 'dart:convert';

import 'package:educative_software/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/chapter_model.dart';
import '../providers/chapter_provider.dart';

class ChapterInfo extends StatefulWidget {
  const ChapterInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChapterInfoState createState() => _ChapterInfoState();
}

class _ChapterInfoState extends State<ChapterInfo> {
  ChapterModel chapter = ChapterModel.nullChapter();
  List<String> info = List.empty(growable: true);

  _updateInfo(ChapterModel chapter, context) async {
    this.chapter = chapter;
    var json = await rootBundle
        .loadString("assets/json/chapter_info_${chapter.chapterID}.json");
    List<dynamic> chapterInfo = await jsonDecode(json);
    info.clear();
    for (var inf in chapterInfo) {
      info.add(inf['info']);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    ChapterModel chapter =
        ModalRoute.of(context)!.settings.arguments as ChapterModel;
    _updateInfo(chapter, context);

    return Scaffold(
        backgroundColor: colors.surfaceContainerHighest,
        appBar: AppBar(
          backgroundColor: colors.onPrimaryFixedVariant,
          foregroundColor: colors.onPrimary,
          title: const Text("INFORMACIÓN DE LA CLASE"),
          leading: const BackButton(),
          centerTitle: true,
        ),
        body: Stack(children: [
          gradient(colors),
          SingleChildScrollView(
              child: SafeArea(
                  child: Center(
                      child: SizedBox(
            height: MediaQuery.of(context).size.height * 9 / 10,
            width: MediaQuery.of(context).size.width * 9.5 / 10,
            child: ListView.builder(
              itemCount: info.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                    semanticContainer: true,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: const Color.fromARGB(0, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            strokeAlign: 1,
                            color: colors.tertiary,
                            width: 1.75),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 100),
                        Image.asset(
                            "assets/images/info_${chapter.chapterID}_${i + 1}.png"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 100),
                        Text(info[i],
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 14,
                                color: colors.surfaceContainerHighest,
                                textBaseline: TextBaseline.alphabetic))
                      ],
                    ));
              },
            ),
          ))))
        ]));
  }
}
