import 'package:milotranslations/core/enums/loading.enum.dart';
import 'package:milotranslations/core/models/resources.model.dart';
import 'package:milotranslations/src/main/repositories/main.repository.dart';

import '../../mock/mockdata.dart';

class MainRepositoryMock extends IMainRepository {
  ELoadingStatus _loadingStatus = ELoadingStatus.completed;

  @override
  Future<List<ResourcesModel>> fetchLanguagesResource() async {
    _loadingStatus = ELoadingStatus.loading;
    var result = await MockData().getData();
    _loadingStatus = ELoadingStatus.completed;

    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

  ELoadingStatus get loadingStatus => _loadingStatus;
}
