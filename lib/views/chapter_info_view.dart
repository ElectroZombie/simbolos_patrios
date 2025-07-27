import 'dart:convert';

import 'package:educative_software/providers/chapter_provider.dart';
import 'package:educative_software/services/db_service.dart';
import 'package:educative_software/styles/button_style.dart';
import 'package:educative_software/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/chapter_model.dart';

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

  void goToChapterInfo(context, int idChapter) async {
    if (idChapter == 0 || idChapter == 6) {
      return;
    } else {
      await Provider.of<ChapterProvider>(context, listen: false)
          .activateNextChapter(idChapter + 1);

      Navigator.pushReplacementNamed(context, '/chapter_info',
          arguments: await DBService.getChapterByID(idChapter));
    }
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
        ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          itemCount: info.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int i) {
            return widgetByIndex(context, i, colors);
          },
        ),
      ]),
    );
  }

  Widget widgetByIndex(BuildContext context, int i, colors) {
    if (i == info.length - 1) {
      return Column(
        children: [
          widgetCard(context, i, colors),
          buttonsBar(context, chapter.chapterID, colors)
        ],
      );
    } else {
      return widgetCard(context, i, colors);
    }
  }

  Widget buttonsBar(context, i, colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => goToChapterInfo(context, i - 1),
            icon: const Icon(Icons.arrow_circle_left_outlined),
            iconSize: 40,
            style: iconButtonStyle(colors)),
        IconButton(
            onPressed: () => goToChapterInfo(context, i + 1),
            icon: const Icon(Icons.arrow_circle_right_outlined),
            iconSize: 40,
            style: iconButtonStyle(colors))
      ],
    );
  }

  Widget widgetCard(BuildContext context, int i, colors) {
    return Card(
        semanticContainer: true,
        margin: const EdgeInsets.symmetric(vertical: 2),
        color: const Color.fromARGB(0, 0, 0, 0),
        shape: RoundedRectangleBorder(
            side:
                BorderSide(strokeAlign: 1, color: colors.tertiary, width: 1.75),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Image.asset("assets/images/info_${chapter.chapterID}_${i + 1}.png"),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(info[i],
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 14,
                        color: colors.surfaceContainerHighest,
                        textBaseline: TextBaseline.alphabetic)))
          ],
        ));
  }
}
