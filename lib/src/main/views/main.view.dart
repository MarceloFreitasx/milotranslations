import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milotranslations/core/styles/styles.dart';
import 'package:milotranslations/core/utils/extensions.util.dart';
import 'package:milotranslations/src/main/controllers/main.controller.dart';
import 'package:milotranslations/src/main/widgets/resourceitem.widget.dart';

class MainView extends GetView<MainController> {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("MiloTranslations", style: AppStyles.subtitle1.copyWith(color: Colors.white)),
            Container(width: 5),
            Text("by @MarceloFreitasx", style: AppStyles.caption1.copyWith(color: Colors.white)),
          ],
        ),
        centerTitle: false,
        actions: [
          Obx(() => IconButton(
                icon: Icon(Icons.filter_alt_outlined),
                onPressed: controller.isLoading ? null : () => controller.showFilter(),
              )),
        ],
      ),
      body: Obx(() => controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.listResources.length,
              itemBuilder: (_, index) {
                final item = controller.listResources[index];
                return ResourceItem(
                  flagIcon: item.resource.flag,
                  language: item.resource.languageValue,
                  resourceId: item.resource.resourceId,
                  updatedAt: item.resource.updatedAt.onlyDateHour,
                  value: item.resource.value,
                );
              })),
    );
  }
}
