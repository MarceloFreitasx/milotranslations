import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:milotranslations/core/styles/styles.dart';
import 'package:milotranslations/src/main/widgets/resourceitem.widget.dart';

void main() {
  Future<void> _createWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: ResourceItem(
          flagIcon: AppAssets.BRAZIL,
          language: "BR",
          resourceId: "Teste",
          updatedAt: "09/03/2021 21:07",
          value: "Testando",
        ),
      ),
    );

    await tester.pump();
  }

  testWidgets("Teste widget: ResourceItem", (WidgetTester tester) async {
    await _createWidget(tester);
    expect(find.text("BR"), findsOneWidget);
    expect(find.text("ID: Teste"), findsOneWidget);
    expect(find.text("Updated: 09/03/2021 21:07"), findsOneWidget);
    expect(find.text("Testando"), findsOneWidget);
  });
}
