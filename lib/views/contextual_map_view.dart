import 'package:educative_software/structs/contextual_icon.dart';
import 'package:educative_software/widgets/confirm_dialog_widget.dart';
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
    await Provider.of<ChapterProvider>(context, listen: false)
        .activateNextChapter(chapter.chapterID + 1);

    Navigator.pushNamed(context, '/chapter_info', arguments: chapter);
  }

  void addClickCount(ChapterModel chapter) {
    if (!M[chapter.chapterID]!.activated) {
      errorDialogWidget(
          "Este capítulo no se encuentra disponible todavía. Primero debes completar el tema anterior",
          context);
      return;
    } else if (chapter.chapterID == 6 || M[chapter.chapterID + 1]!.activated) {
      goToChapterInfo(context, chapter);
      return;
    } else {
      M[chapter.chapterID]!.touchCount = M[chapter.chapterID]!.touchCount! + 1;

      if (M[chapter.chapterID]!.touchCount == 2) {
        M[chapter.chapterID]!.touchCount = 0;
        setState(() {});
        goToChapterInfo(context, chapter);
      }
      setState(() {});
    }
  }

  int isEnabled(int index) {
    if (M[index]!.activated) {
      if (index == 6 || M[index + 1]!.activated) {
        return 0;
      }
      if (M[index]!.touchCount == 0) {
        return 1;
      } else {
        return 2;
      }
    } else {
      return 1;
    }
  }

  Widget selectStyle(int index) {
    if (M[index]!.activated) {
      if (index == 6 || M[index + 1]!.activated) {
        return Text("#${M[index]!.id}",
            style:
                const TextStyle(fontSize: 14, fontFamily: "Times new roman"));
      }
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

    icon_1.activated =
        Provider.of<ChapterProvider>(context).getChapter(1).activated;
    icon_2.activated =
        Provider.of<ChapterProvider>(context).getChapter(2).activated;
    icon_3.activated =
        Provider.of<ChapterProvider>(context).getChapter(3).activated;
    icon_4.activated =
        Provider.of<ChapterProvider>(context).getChapter(4).activated;
    icon_5.activated =
        Provider.of<ChapterProvider>(context).getChapter(5).activated;
    icon_6.activated =
        Provider.of<ChapterProvider>(context).getChapter(6).activated;

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
              onPressed: () => confirmDialogWidget(
                      "Deseas eliminar el progreso actual?", context)
                  .then(
                (value) {
                  if (value) {
                    Provider.of<ChapterProvider>(context, listen: false)
                        .cleanProgress();
                  }
                },
              ),
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
                              buttonIndex(data.getChapter(1), colors),
                              buttonIndex(data.getChapter(2), colors),
                              buttonIndex(data.getChapter(3), colors),
                            ],
                          ),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.21),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buttonIndex(data.getChapter(4), colors),
                              buttonIndex(data.getChapter(5), colors),
                            ],
                          ),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.21),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buttonIndex(data.getChapter(6), colors),
                            ],
                          ),
                        ])))
          ],
        ));
  }

  Widget buttonIndex(ChapterModel chapter, colors) {
    return IconButton(
        onPressed: () => addClickCount(chapter),
        style: iconButtonEnabledStyle(colors, isEnabled(chapter.chapterID)),
        icon: selectStyle(chapter.chapterID));
  }
}
