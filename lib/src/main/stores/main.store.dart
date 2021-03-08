import 'package:get/get.dart';
import 'package:milotranslations/core/enums/loading.enum.dart';
import 'package:milotranslations/core/models/resources.model.dart';
import 'package:milotranslations/src/main/repositories/main.repository.dart';

abstract class IMainStore extends GetxController {
  Future<bool> fetchLangaguesResource();
  ELoadingStatus get loadingStatus;
  set loadingStatus(ELoadingStatus value);
  List<ResourcesModel> get listResources;
  set listResources(List<ResourcesModel> value);
  String get selectedLanguage;
  set selectedLanguage(String value);
  String get selectedModule;
  set selectedModule(String value);
}

class MainStore extends IMainStore {
  MainStore(this._repository);

  IMainRepository _repository;

  final _loadingStatus = ELoadingStatus.completed.obs;
  final _listResources = List<ResourcesModel>().obs;

  final _selectedLanguage = RxString();
  final _selectedModule = RxString();

  @override
  Future<bool> fetchLangaguesResource() async {
    _loadingStatus.value = ELoadingStatus.loading;
    return await _repository.fetchLanguagesResource().then((value) {
      if (value != null) {
        _listResources.assignAll(value);
      }
      _loadingStatus.value = _repository.loadingStatus;
      return value != null;
    });
  }

  @override
  ELoadingStatus get loadingStatus => _loadingStatus.value;

  @override
  set loadingStatus(ELoadingStatus value) => _loadingStatus.value = value;

  @override
  List<ResourcesModel> get listResources => _listResources;

  @override
  set listResources(List<ResourcesModel> value) => _listResources.assignAll(value);

  @override
  String get selectedLanguage => _selectedLanguage.value;

  @override
  set selectedLanguage(String value) => _selectedLanguage.value = value;

  @override
  String get selectedModule => _selectedModule.value;

  @override
  set selectedModule(String value) => _selectedModule.value = value;
}
