import 'package:flutter_test/flutter_test.dart';
import 'package:milotranslations/core/enums/loading.enum.dart';

import 'mock/main.repository.mock.dart';
import 'mock/main.store.mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Testes regras de negocio/lógica do módulo principal", () {
    test("Validação repository", () async {
      MainRepositoryMock repository = MainRepositoryMock();

      assert(await repository.fetchLanguagesResource() != null);
      assert(repository.loadingStatus == ELoadingStatus.completed);
    });
    test("Validação store", () {
      MainStoreMock store = MainStoreMock();
      store.fetchLangaguesResource();

      assert(store.loadingStatus == ELoadingStatus.completed);
      assert(store.listResources != null);
    });
  });
}
