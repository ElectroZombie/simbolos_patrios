import 'package:provider/provider.dart';
import 'package:simbolos_nacionales_ult/structs/info_sheet_data.dart';
import 'package:simbolos_nacionales_ult/utils/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../providers/language_provider.dart';
import '../utils/enum_types.dart';
import '../widgets/gradient.dart';
import '../styles/button_style.dart';

infoSheet(
    BuildContext context, ColorScheme colors, InfoSheetData infoSheetData) {
  showModalBottomSheet(
      backgroundColor: colors.surface,
      isScrollControlled: true,
      context: context,
      elevation: 5,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Stack(children: [
          gradient(colors),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                  child: Center(
                child: ChangeNotifierProvider(
                  create: (context) => LanguageProvider(),
                  builder: (context, child) => Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 5 / 100),
                      Text(
                        "INFORMACIÓN DE LA APLICACIÓN:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: colors.tertiary,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 5 / 100),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 9.5 / 10,
                          child: Card(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: colors.tertiary, width: 1.75),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      9 /
                                      10,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Consumer<LanguageProvider>(
                                          builder: (context, data, child) =>
                                              _showText(
                                                  data.language,
                                                  colors,
                                                  2,
                                                  infoSheetData.optionList))),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100),
                              ],
                            ),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 9.5 / 10,
                          child: Card(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: colors.tertiary, width: 1.75),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        9 /
                                        10,
                                    child: Column(children: [
                                      Consumer<LanguageProvider>(
                                          builder: (context, data, child) =>
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: _showText(
                                                      data.language,
                                                      colors,
                                                      0,
                                                      infoSheetData
                                                          .optionList))),
                                      const SizedBox(height: 5),
                                      Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                    style: buttonStyle(colors),
                                                    child: const Text("GitHub"),
                                                    onPressed: () => _launchUrl(
                                                        infoSheetData,
                                                        LinkTypes.gitHub)),
                                                const SizedBox(width: 5),
                                                TextButton(
                                                    style: buttonStyle(colors),
                                                    child: const Text("Email"),
                                                    onPressed: () => _launchUrl(
                                                        infoSheetData,
                                                        LinkTypes.email))
                                              ]),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Consumer<LanguageProvider>(
                                              builder: (context, data, child) =>
                                                  OutlinedButton.icon(
                                                      onPressed: () =>
                                                          Provider.of<LanguageProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .changeLanguage(),
                                                      label: _showText(
                                                          data.language,
                                                          colors,
                                                          1,
                                                          infoSheetData
                                                              .optionList),
                                                      style:
                                                          buttonStyle(colors),
                                                      icon: const Icon(
                                                          Icons.catching_pokemon_rounded))),
                                        ],
                                      )
                                    ])),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100),
                              ],
                            ),
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 5 / 100),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 4.5 / 10,
                          child: Card(
                              color: colors.tertiary,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: colors.tertiary, width: 1.75),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100),
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
                                          MediaQuery.of(context).size.height /
                                              100),
                                ],
                              )))
                    ],
                  ),
                ),
              )))
        ]);
      });
}

Future<void> _launchUrl(InfoSheetData infoSheetData, LinkTypes linkType) async {
  if (!await launchUrl(
      mode: LaunchMode.platformDefault, infoSheetData.linkMap[linkType])) {
    throw Exception('Could not launch the URL');
  }
}

Widget _showText(LanguageEnum language, ColorScheme colors, int option,
    List<Tuple<String, String>> optionList) {
  return language == LanguageEnum.en
      ? Text(optionList[option].T!,
          maxLines: 20,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            color: colors.surfaceContainerHighest,
          ))
      : Text(optionList[option].K!,
          maxLines: 20,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            color: colors.surfaceContainerHighest,
          ));
}
