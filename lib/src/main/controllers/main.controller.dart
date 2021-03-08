import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milotranslations/core/enums/loading.enum.dart';
import 'package:milotranslations/core/models/resources.model.dart';
import 'package:milotranslations/core/services/localstorage.service.dart';
import 'package:milotranslations/src/main/stores/main.store.dart';
import 'package:milotranslations/src/main/views/filter.view.dart';

class MainController {
  MainController(this._store) {
    _storage = LocalStorage("resources");

    if (_storage.read() != null)
      _store.listResources =
          List<ResourcesModel>.from(jsonDecode(_storage.read()).map((x) => ResourcesModel.fromJson(x)));
    else
      _store.fetchLangaguesResource().then((value) {
        if (value) _buildFilter();
      });
  }

  IMainStore _store;
  LocalStorage _storage;

  bool get isLoading => _store.loadingStatus == ELoadingStatus.loading;
  List<ResourcesModel> get listResources => _store.listResources;
  List<ResourcesModel> _originalResources;

  String get selectedModule => _store.selectedModule;
  set selectedModule(String value) => _store.selectedModule = value;
  String get selectedLanguage => _store.selectedLanguage;
  set selectedLanguage(String value) => _store.selectedLanguage = value;

  List<String> listLanguages;
  List<String> listModules;

  final search = TextEditingController();

  _buildFilter() {
    _originalResources = List<ResourcesModel>.of(_store.listResources);
    _storage.write(_originalResources.map((e) => e.toRawJson()).toList().toString());

    listLanguages =
        _store.listResources.expand((element) => [element.resource.languageValue]).toList().toSet().toList();

    listModules = _store.listResources.expand((element) => [element.resource.moduleValue]).toList().toSet().toList();
  }

  showFilter() {
    Get.bottomSheet(BottomSheet(
      onClosing: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (_) => FilterView(),
    ));
  }

  doFilter() {
    Get.back();
    _store.loadingStatus = ELoadingStatus.loading;
    if (search.text.isNotEmpty) {
      listResources.removeWhere((element) => !removeDiacritics(element.resource.value.toLowerCase())
          .contains(removeDiacritics(search.text.toLowerCase())));
    }
    if (!selectedLanguage.isNull) {
      listResources.removeWhere((element) => element.resource.languageValue != selectedLanguage);
    }

    if (!selectedModule.isNull) {
      listResources.removeWhere((element) => element.resource.moduleValue != selectedModule);
    }
    _store.loadingStatus = ELoadingStatus.completed;
  }

  clearFilter() {
    search.clear();
    selectedLanguage = null;
    selectedModule = null;
    _store.listResources = _originalResources;
    Get.back();
  }
}
