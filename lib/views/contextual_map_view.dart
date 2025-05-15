import 'package:educative_software/widgets/gradient.dart';
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
  @override
  void initState() {
    super.initState();
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
        body: Stack(children: [
          gradient(colors),
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
                          ))))
        ]));
  }
}
