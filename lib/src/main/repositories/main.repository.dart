import 'package:milotranslations/core/enums/loading.enum.dart';
import 'package:milotranslations/core/models/resources.model.dart';
import 'package:milotranslations/core/routes/routes.dart';
import 'package:milotranslations/core/services/api.service.dart';

abstract class IMainRepository {
  Future<List<ResourcesModel>> fetchLanguagesResource();
  ELoadingStatus get loadingStatus;
}

class MainRepository extends IMainRepository {
  MainRepository(this._api);

  IApi _api;
  ELoadingStatus _loadingStatus = ELoadingStatus.completed;

  @override
  Future<List<ResourcesModel>> fetchLanguagesResource() async {
    _loadingStatus = ELoadingStatus.loading;
    var result = await _api.call(EApiType.get, ApiRoutes.baseUrl);

    _loadingStatus = ELoadingStatus.completed;

    if (result != null) {
      return List<ResourcesModel>.from(result.data.map((x) => ResourcesModel.fromJson(x)));
    } else {
      return null;
    }
  }

  ELoadingStatus get loadingStatus => _loadingStatus;
}
