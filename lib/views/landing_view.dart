import 'package:educative_software/providers/chapter_provider.dart';
import 'package:educative_software/styles/button_style.dart';
import 'package:educative_software/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/info_sheet.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  void goToContextualMap(context) async {
    await Provider.of<ChapterProvider>(context, listen: false).setValues();
    Navigator.pushNamed(context, '/contextual_map');
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: colors.surfaceContainerHighest,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => showSheet(context, colors),
              icon: const Icon(Icons.info),
              tooltip: "Información",
            ),
          ],
          backgroundColor: colors.onPrimaryFixedVariant,
          centerTitle: true,
          title: Text(
            "SÍMBOLOS NACIONALES",
            style: TextStyle(fontSize: 20, color: colors.onSurface),
          ),
        ),
        body: Stack(children: [
          gradient(colors),
          Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 10,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: MediaQuery.of(context).size.height * 3 / 10,
                    width: MediaQuery.of(context).size.width * 8 / 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5 / 10,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 9.5 / 10,
                      child: Card(
                        color: const Color.fromARGB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: colors.tertiary, width: 1.75),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 9 / 10,
                              child: Text(
                                  "UNA APLICACIÓN PARA CONOCER Y ESTUDIAR LOS SÍMBOLOS Y ATRIBUTOS PATRIOS",
                                  maxLines: 11,
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors.surfaceContainerHighest,
                                  )),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5 / 10,
                  ),
                  TextButton(
                    onPressed: () => goToContextualMap(context),
                    style: buttonStyle(colors),
                    child: const Text("COMENZAR"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25 / 10,
                  )
                ],
              ))
        ]));
  }
}

void showSheet(context, colors) {
  infoSheet(context, colors);
}
