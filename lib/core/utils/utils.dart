import 'package:flutter/services.dart';
import 'package:milotranslations/core/styles/styles.dart';

class Utils {
  //Allow text input for:
  static get onlyLetters => new FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÊÍÏÓÔÕÖÚÇÑ ]"));
  static get onlyLettersAndNumbers =>
      new FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÊÍÏÓÔÕÖÚÇÑ ]"));

  static String flag(String languageId) {
    switch (languageId) {
      case "cs":
        return AppAssets.CZECH;
      case "de":
        return AppAssets.GERMANY;
      case "en":
        return AppAssets.UNITED_KINGDOM;
      case "en-g":
        return AppAssets.UNITED_STATES;
      case "es":
        return AppAssets.SPAIN;
      case "fr":
        return AppAssets.FRANCE;
      case "hw":
        return AppAssets.HAWAII;
      case "it":
        return AppAssets.ITALY;
      case "ja":
        return AppAssets.JAPAN;
      case "pt":
        return AppAssets.BRAZIL;
      case "ro":
        return AppAssets.ROMANIA;
      case "ru":
        return AppAssets.RUSSIA;
      case "th":
        return AppAssets.THAILAND;
      default:
        return AppAssets.UNITED_NATIONS;
    }
  }
}
