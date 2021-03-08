import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:milotranslations/core/styles/styles.dart';
import 'package:milotranslations/core/utils/extensions.util.dart';
import 'package:milotranslations/src/main/controllers/main.controller.dart';

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
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(item.resource.flag, width: 24, height: 24),
                            Text(item.resource.languageValue.toUpperCase(), style: AppStyles.caption1),
                          ],
                        ),
                        Container(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${item.resource.value}", style: AppStyles.subtitle1),
                              Container(height: 5),
                              Text("ID: ${item.resource.resourceId}", style: AppStyles.body1),
                              Container(height: 5),
                              Text("Updated: ${item.resource.updatedAt.onlyDateHour}", style: AppStyles.caption1),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
