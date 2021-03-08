// To parse this JSON data, do
//
//     final resourcesModel = resourcesModelFromJson(jsonString);

import 'dart:convert';

import 'package:milotranslations/core/styles/appassets.style.dart';

class ResourcesModel {
  ResourcesModel({
    this.resource,
  });

  Resource resource;

  factory ResourcesModel.fromRawJson(String str) => ResourcesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResourcesModel.fromJson(Map<String, dynamic> json) => ResourcesModel(
        resource: json["resource"] == null ? null : Resource.fromJson(json["resource"]),
      );

  Map<String, dynamic> toJson() => {
        "resource": resource == null ? null : resource.toJson(),
      };
}

class Resource {
  Resource({
    this.createdAt,
    this.updatedAt,
    this.resourceId,
    this.moduleId,
    this.value,
    this.languageId,
  });

  DateTime createdAt;
  DateTime updatedAt;
  String resourceId;
  ModuleId moduleId;
  String value;
  LanguageId languageId;

  factory Resource.fromRawJson(String str) => Resource.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  String get languageValue => languageIdValues.reverse[languageId];
  String get moduleValue => moduleIdValues.reverse[moduleId];
  String get flag {
    switch (languageId) {
      case LanguageId.CS:
        return AppAssets.CZECH;
      case LanguageId.DE:
        return AppAssets.GERMANY;
      case LanguageId.EN:
        return AppAssets.UNITED_KINGDOM;
      case LanguageId.EN_G:
        return AppAssets.UNITED_STATES;
      case LanguageId.ES:
        return AppAssets.SPAIN;
      case LanguageId.FR:
        return AppAssets.FRANCE;
      case LanguageId.HW:
        return AppAssets.HAWAII;
      case LanguageId.IT:
        return AppAssets.ITALY;
      case LanguageId.JA:
        return AppAssets.JAPAN;
      case LanguageId.PT:
        return AppAssets.BRAZIL;
      case LanguageId.RO:
        return AppAssets.ROMANIA;
      case LanguageId.RU:
        return AppAssets.RUSSIA;
      case LanguageId.TH:
        return AppAssets.THAILAND;
      default:
        return AppAssets.UNITED_NATIONS;
    }
  }

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        resourceId: json["resource_id"] == null ? null : json["resource_id"],
        moduleId: json["module_id"] == null ? null : moduleIdValues.map[json["module_id"]],
        value: json["value"] == null ? null : json["value"],
        languageId: json["language_id"] == null ? null : languageIdValues.map[json["language_id"]],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "resource_id": resourceId == null ? null : resourceId,
        "module_id": moduleId == null ? null : moduleIdValues.reverse[moduleId],
        "value": value == null ? null : value,
        "language_id": languageId == null ? null : languageIdValues.reverse[languageId],
      };
}

enum LanguageId { EN, DE, IT, FR, TH, ES, JA, PT, RU, CS, HW, EN_G, RO }

final languageIdValues = EnumValues({
  "cs": LanguageId.CS,
  "de": LanguageId.DE,
  "en": LanguageId.EN,
  "en-g": LanguageId.EN_G,
  "es": LanguageId.ES,
  "fr": LanguageId.FR,
  "hw": LanguageId.HW,
  "it": LanguageId.IT,
  "ja": LanguageId.JA,
  "pt": LanguageId.PT,
  "ro": LanguageId.RO,
  "ru": LanguageId.RU,
  "th": LanguageId.TH
});

enum ModuleId {
  GREEN_MILE_TRACK,
  GREEN_MILE_DRIVER,
  GREEN_MILE_COMMONS,
  GREEN_MILE_MY_ORDER,
  GREEN_MILE_MANAGER,
  GREEN_MILE_ROUTING,
  GREEN_MILE_CHAT,
  DEPOT,
  CENTRAL,
  JME,
  GREEN_MILE_DRIVER_GENERIC,
  GREEN_MILE_DRIVER_JME,
  BI,
  GREEN_MILE_DEPOT,
  GREEN_MILE_REPORT,
  MANAGER,
  LIVE_FEED,
  BS_BOARD,
  DI_MANAGER,
  GREEN_MILE_LOADER
}

final moduleIdValues = EnumValues({
  "BI": ModuleId.BI,
  "BSBoard": ModuleId.BS_BOARD,
  "central": ModuleId.CENTRAL,
  "DEPOT": ModuleId.DEPOT,
  "DIManager": ModuleId.DI_MANAGER,
  "GreenMileChat": ModuleId.GREEN_MILE_CHAT,
  "GreenMileCommons": ModuleId.GREEN_MILE_COMMONS,
  "GreenMileDepot": ModuleId.GREEN_MILE_DEPOT,
  "GreenMileDriver": ModuleId.GREEN_MILE_DRIVER,
  "GreenMileDriverGeneric": ModuleId.GREEN_MILE_DRIVER_GENERIC,
  "GreenMileDriverJME": ModuleId.GREEN_MILE_DRIVER_JME,
  "GreenMileLoader": ModuleId.GREEN_MILE_LOADER,
  "GreenMileManager": ModuleId.GREEN_MILE_MANAGER,
  "GreenMileMyOrder": ModuleId.GREEN_MILE_MY_ORDER,
  "GreenMileReport": ModuleId.GREEN_MILE_REPORT,
  "GreenMileRouting": ModuleId.GREEN_MILE_ROUTING,
  "GreenMileTrack": ModuleId.GREEN_MILE_TRACK,
  "JME": ModuleId.JME,
  "LiveFeed": ModuleId.LIVE_FEED,
  "MANAGER": ModuleId.MANAGER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
