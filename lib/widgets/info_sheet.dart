import 'package:educative_software/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:educative_software/styles/button_style.dart';
import 'package:url_launcher/url_launcher.dart';

Widget infoSheet(BuildContext context, ColorScheme colors) {
  return Stack(children: [
    gradient(colors),
    SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 5 / 100),
                Text(
                  "INFORMACIÓN DE LA APLICACIÓN:",
                  style: TextStyle(fontSize: 18, color: colors.surface),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 5 / 100),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 9.5 / 10,
                    child: Card(
                      color: const Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: colors.tertiary, width: 1.75),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 9 / 10,
                            child: Text(
                                "La aplicación para dispositivos móviles, con el objetivo de favorecer los conocimientos de los símbolos nacionales."
                                "constituye un medio de enseñanza útil y eficaz que persigue como objetivo desarrollar una aplicación móvil"
                                "para fortalecer los aspectos esenciales sobre los símbolos nacionales que se establecen en"
                                "LA LEY NO 128 LEY DE LOS SÍMBOLOS NACIONALES DE LA REPÚBLICA DE CUBA, publicado en la Gaceta Oficial"
                                "el 19 de septiembre de 2019. Se hace un análisis de la problemática surtida al respeto de los Símbolos Nacionales"
                                "luego de una revisión bibliográfica, se determinó la viabilidad de la proyección y creación de la misma."
                                "Para el desarrollo de esta, se tuvo en cuenta los parámetros teóricos de diseño de software educativo,"
                                "en vista a lograr un aplicativo que satisfaga las necesidades del usuario final, destacándose los parámetros de"
                                "diseño de las aplicaciones móviles  y otros que sirven también para validar la aplicación.",
                                maxLines: 20,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: colors.surfaceContainerHighest,
                                )),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                        ],
                      ),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 9.5 / 10,
                    child: Card(
                      color: const Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: colors.tertiary, width: 1.75),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 9 / 10,
                              child: Column(children: [
                                Text(
                                    "A mobile application to support learning about national simbols of Cuba "
                                    "(v0.5.6)\n"
                                    "Programmer: "
                                    "Eric Michel Villavicencio Reyes\n"
                                    "Buildig Specs:\n"
                                    "Java Version: 17.0.13\n"
                                    "SQLite 3 Version: 3.46.1\n"
                                    "Dart SDK: 3.4.0\n\n"
                                    "Built on:\n"
                                    "Flutter SDK: 3.22.0\n"
                                    "Android SDK: 31.0.0\n"
                                    "Code-OSS: 1.95.1\n\n"
                                    "Developed on:\n"
                                    "Linux x64 6.12.1-arch1-1",
                                    maxLines: 20,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: colors.surfaceContainerHighest,
                                    )),
                                const SizedBox(height: 5),
                                TextButton(
                                    style: buttonStyle(colors),
                                    child: const Text("GitHub"),
                                    onPressed: () => _launchUrl()),
                              ])),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                        ],
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 5 / 100),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 4.5 / 10,
                    child: Card(
                        color: colors.tertiary,
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: colors.tertiary, width: 1.75),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.cancel),
                              style: iconButtonStyle(colors),
                            ),
                            Text(
                              "Cerrar",
                              style: TextStyle(
                                  fontSize: 16, color: colors.onTertiary),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                          ],
                        )))
              ],
            ),
          ),
        ))
  ]);
}

Future<void> _launchUrl() async {
  if (!await launchUrl(
      mode: LaunchMode.platformDefault,
      Uri.http('github.com', '/ElectroZombie'))) {
    throw Exception('Could not launch https://github.com/ElectroZombie');
  }
}
