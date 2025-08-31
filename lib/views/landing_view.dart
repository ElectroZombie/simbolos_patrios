import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simbolos_nacionales_ult/structs/info_sheet_data.dart';
import 'package:simbolos_nacionales_ult/utils/enum_types.dart';

import '../providers/chapter_provider.dart';
import '../styles/button_style.dart';
import '../utils/tuple.dart';
import '../widgets/gradient.dart';
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
            style: TextStyle(fontSize: 18, color: colors.onSurface),
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
  List<Tuple<String, String>> optionList = [
    Tuple(
        T: "A mobile application to learn about Cuba's national simbols\n"
            "(v1.7.7)\n"
            "Developer: "
            "Eric Michel Villavicencio Reyes\n"
            "Building Specs:\n"
            "Java Version: 17.0.15+6\n"
            "SQLite 3: 3.49.2\n"
            "Dart SDK: 3.4.0\n\n"
            "Built on:\n"
            "Flutter SDK: 3.22.0\n"
            "Android SDK: 31.0.0\n"
            "Code-OSS: 1.100.2\n\n"
            "Developed on:\n"
            "Linux x64 6.14.6-arch1-1",
        K: "Una aplicación móvil para apoyar el aprendizaje de los símbolos nacionales de Cuba\n"
            "(v1.7.7)\n"
            "Desarrollador: "
            "Eric Michel Villavicencio Reyes\n"
            "Especificaciones:\n"
            "Java Version: 17.0.15+6\n"
            "SQLite 3: 3.49.2\n"
            "Dart SDK: 3.4.0\n\n"
            "Construido con:\n"
            "Flutter SDK: 3.22.0\n"
            "Android SDK: 31.0.0\n"
            "Code-OSS: 1.100.2\n\n"
            "Desarrollado en:\n"
            "Linux x64 6.14.6-arch1-1"),
    Tuple(T: "EN", K: "ES"),
    Tuple(
        T: "The National Symbols application for mobile devices, aimed at enhancing knowledge of national symbols, "
            "constitutes a useful and effective teaching tool that seeks to develop a mobile application to "
            "strengthen the essential aspects of national symbols of Cuba",
        K: "La aplicación Símbolos Nacionales para dispositivos móviles, con el objetivo de favorecer los "
            "conocimientos de los símbolos nacionales, constituye un medio de enseñanza útil y eficaz que persigue "
            "como objetivo desarrollar una aplicación móvil para fortalecer los aspectos esenciales sobre los "
            "símbolos nacionales de Cuba")
  ];
  Map<LinkTypes, dynamic> linkMap = {
    LinkTypes.gitHub: Uri.http('github.com', '/ElectroZombie'),
    LinkTypes.email: Uri(scheme: 'mailto', path: 'daphniphyllum901@gmail.com')
  };
  infoSheet(context, colors, InfoSheetData(optionList, linkMap));
}
