import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:milotranslations/core/styles/styles.dart';
import 'package:milotranslations/core/utils/utils.dart';
import 'package:milotranslations/src/main/controllers/main.controller.dart';

class FilterView extends GetView<MainController> {
  const FilterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text("Filtro", style: AppStyles.head1)),
            Container(height: 40),
            Text("Buscar por texto:", style: AppStyles.body4),
            TextFormField(
              controller: controller.search,
              style: AppStyles.body2,
              inputFormatters: [Utils.onlyLettersAndNumbers],
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                isDense: true,
              ),
            ),
            Container(height: 20),
            Text("Língua", style: AppStyles.body4),
            Obx(() => DropdownButton<String>(
                  value: controller.selectedLanguage,
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) => controller.selectedLanguage = newValue,
                  items: controller.listLanguages.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          SvgPicture.asset(Utils.flag(value), width: 16, height: 16),
                          Container(width: 5),
                          Text(value.toUpperCase(), style: AppStyles.body2),
                        ],
                      ),
                    );
                  }).toList(),
                )),
            Container(height: 20),
            Text("Módulo", style: AppStyles.body4),
            Obx(() => DropdownButton<String>(
                  value: controller.selectedModule,
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) => controller.selectedModule = newValue,
                  items: controller.listModules.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value.toUpperCase(), style: AppStyles.body2));
                  }).toList(),
                )),
            Container(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => controller.clearFilter(),
                    child: Text("Limpar Filtro"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => controller.doFilter(),
                    child: Text("Filtrar"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
