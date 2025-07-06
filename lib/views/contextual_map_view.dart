import 'package:educative_software/structs/contextual_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:educative_software/models/chapter_model.dart';
import 'package:educative_software/providers/chapter_provider.dart';

import '../styles/button_style.dart';
import '../widgets/error_dialog_widget.dart';

class ContextualMap extends StatefulWidget {
  const ContextualMap({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContextualMapState createState() => _ContextualMapState();
}

class _ContextualMapState extends State<ContextualMap> {
  ContextualIcon icon_1 = ContextualIcon(
      id: 1,
      activated: true,
      text: "Clase #1: La bandera de la estrella solitaria");
  ContextualIcon icon_2 = ContextualIcon(
      id: 2, activated: false, text: "Clase #2: El himno de Bayamo");
  ContextualIcon icon_3 = ContextualIcon(
      id: 3, activated: false, text: "Clase #3: El escudo de la palma real");
  ContextualIcon icon_4 = ContextualIcon(
      id: 4, activated: false, text: "Clase #4: La flor Mariposa");
  ContextualIcon icon_5 =
      ContextualIcon(id: 5, activated: false, text: "Clase #5: El tocororo");
  ContextualIcon icon_6 =
      ContextualIcon(id: 6, activated: false, text: "Clase #6: La palma real");

  Map<int, ContextualIcon> M = {};

  @override
  void initState() {
    super.initState();

    M = {1: icon_1, 2: icon_2, 3: icon_3, 4: icon_4, 5: icon_5, 6: icon_6};
  }

  void goToChapterInfo(context, ChapterModel chapter) async {
    if (!Provider.of<ChapterProvider>(context, listen: false)
        .getChapter(chapter.chapterID)
        .activated) {
      errorDialogWidget("Todavia este capitulo no esta disponible", context);
    } else {
      Navigator.pushNamed(context, '/chapter_info', arguments: chapter);
    }
  }

  void addClickCount(ChapterModel chapter) {
    if (!M[chapter.chapterID + 1]!.activated) {
      return;
    }
    M[chapter.chapterID + 1]!.touchCount =
        M[chapter.chapterID + 1]!.touchCount! + 1;

    if (M[chapter.chapterID + 1]!.touchCount == 2) {
      M[chapter.chapterID + 1]!.touchCount = 0;
      setState(() {});
      goToChapterInfo(context, chapter);
    }
    setState(() {});
  }

  Widget selectStyle(int index) {
    if (M[index]!.activated) {
      if (M[index]!.touchCount == 0) {
        return const Icon(
          Icons.question_mark_outlined,
          size: 30,
        );
      } else {
        return Text("#${M[index]!.id}",
            style:
                const TextStyle(fontSize: 14, fontFamily: "Times new roman"));
      }
    } else {
      return const Icon(
        Icons.cancel_rounded,
        size: 30,
      );
    }
  }

  void selectOptions() {}

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: colors.surfaceContainerHighest,
        appBar: AppBar(
          backgroundColor: colors.onPrimaryFixedVariant,
          title: const Text(
            "CONTENIDOS",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () =>
                  Provider.of<ChapterProvider>(context).cleanProgress,
              icon: const Icon(Icons.clear_outlined),
              style: iconButtonStyle(colors),
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/landing.png",
              fit: BoxFit.fill,
            ),
            Center(
                widthFactor: (MediaQuery.of(context).size.width * 0.9),
                child: Consumer<ChapterProvider>(
                    builder: (context, data, child) => Column(children: [
                          SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.21),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonIndex(data.getChapter(0), colors),
                              buttonIndex(data.getChapter(1), colors),
                              buttonIndex(data.getChapter(2), colors),
                            ],
                          ),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.21),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buttonIndex(data.getChapter(3), colors),
                              buttonIndex(data.getChapter(4), colors),
                            ],
                          ),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.21),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buttonIndex(data.getChapter(5), colors),
                            ],
                          ),
                        ])))
          ],
        )
        /*gradient(colors),
          Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 9 / 10,
                  child: ListView.builder(
                      itemExtent: MediaQuery.of(context).size.height * 1.5 / 10,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) => ListTile(
                            visualDensity: const VisualDensity(vertical: 4),
                            tileColor: colors.primary,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: colors.tertiary, width: 1.75),
                                borderRadius: BorderRadius.circular(5)),
                            titleAlignment: ListTileTitleAlignment.titleHeight,
                            title: Text("Clase #${index + 1}",
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Times new roman")),
                            subtitle: Consumer<ChapterProvider>(
                                builder: (context, data, child) => Column(
                                      children: [
                                        SizedBox(
                                            height: (MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.10) /
                                                10),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  'assets/images/info_${data.getChapter(index).chapterID + 1}_1.png',
                                                  height: 50,
                                                  width: 50),
                                              const SizedBox(width: 10),
                                              IconButton(
                                                onPressed: () =>
                                                    goToChapterInfo(context,
                                                        data.getChapter(index)),
                                                icon: const Icon(Icons
                                                    .arrow_circle_right_outlined),
                                                tooltip: "IR AL CONTENIDO",
                                              ),
                                              Text(
                                                data
                                                    .getChapter(index)
                                                    .chapterName,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        "Times new roman"),
                                              )
                                            ]),
                                        SizedBox(
                                            height: (MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5) /
                                                10),
                                      ],
                                    )),
                          ))))*/
        );
  }

  Widget buttonIndex(ChapterModel chapter, colors) {
    return ElevatedButton(
      onPressed: () => addClickCount(chapter),
      style: iconButtonStyle(colors),
      child: selectStyle(chapter.chapterID + 1),
    );
  }
}
