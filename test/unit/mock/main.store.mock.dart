import 'package:milotranslations/core/enums/loading.enum.dart';
import 'package:milotranslations/core/models/resources.model.dart';
import 'package:milotranslations/src/main/stores/main.store.dart';

import '../../mock/mockdata.dart';

class MainStoreMock extends IMainStore {
  var _loadingStatus = ELoadingStatus.completed;
  var _listResources = List<ResourcesModel>();

  var _selectedLanguage = "";
  var _selectedModule = "";

  @override
  Future<bool> fetchLangaguesResource() async {
    _listResources = await MockData().getData();
    return true;
  }

  @override
  ELoadingStatus get loadingStatus => _loadingStatus;

  @override
  set loadingStatus(ELoadingStatus value) => _loadingStatus = value;

  @override
  List<ResourcesModel> get listResources => _listResources;

  @override
  set listResources(List<ResourcesModel> value) => _listResources = value;

  @override
  String get selectedLanguage => _selectedLanguage;

  @override
  set selectedLanguage(String value) => _selectedLanguage = value;

  @override
  String get selectedModule => _selectedModule;

  @override
  set selectedModule(String value) => _selectedModule = value;
}
