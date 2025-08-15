import 'package:educative_software/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:educative_software/styles/button_style.dart';
import 'package:url_launcher/url_launcher.dart';

Widget infoSheet(BuildContext context, ColorScheme colors) {
  bool language = true;
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
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    "La aplicación para dispositivos móviles, con el objetivo de favorecer los conocimientos de los símbolos nacionales, "
                                    "constituye un medio de enseñanza útil y eficaz que persigue como objetivo desarrollar una aplicación móvil "
                                    "para fortalecer los aspectos esenciales sobre los símbolos nacionales que se establecen en "
                                    "LA LEY NO 128 LEY DE LOS SÍMBOLOS NACIONALES DE LA REPÚBLICA DE CUBA, publicado en la Gaceta Oficial "
                                    "el 19 de septiembre de 2019.",
                                    maxLines: 20,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: colors.surfaceContainerHighest,
                                    ))),
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
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: _showText(language, colors)),
                                const SizedBox(height: 5),
                                Column(
                                  children: [
                                    TextButton(
                                        style: buttonStyle(colors),
                                        child: const Text("GitHub"),
                                        onPressed: () => _launchUrl()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    OutlinedButton.icon(
                                        onPressed: () => {language = !language},
                                        label: _showText2(language, colors),
                                        icon: const Icon(
                                            Icons.catching_pokemon_rounded)),
                                  ],
                                )
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

Widget _showText(bool language, colors) {
  return language
      ? Text(
          "A mobile application to support learning about Cuba's national simbols"
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
          maxLines: 20,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            color: colors.surfaceContainerHighest,
          ))
      : Text(
          "Una aplicación móvil para apoyar el aprendizaje de los símbolos nacionales de Cuba"
          "(v1.7.7)\n"
          "Desarrolladore: "
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
          "Linux x64 6.14.6-arch1-1",
          maxLines: 20,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            color: colors.surfaceContainerHighest,
          ));
}

Widget _showText2(bool language, colors) {
  return language ? const Text("EN") : const Text("ES");
}
