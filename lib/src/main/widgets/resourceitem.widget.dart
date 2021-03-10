import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:milotranslations/core/styles/styles.dart';

class ResourceItem extends StatelessWidget {
  final String flagIcon;
  final String language;
  final String value;
  final String resourceId;
  final String updatedAt;

  const ResourceItem({
    Key key,
    @required this.flagIcon,
    @required this.language,
    @required this.resourceId,
    @required this.updatedAt,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              children: [
                SvgPicture.asset(flagIcon, width: 24, height: 24),
                Text(language.toUpperCase(), style: AppStyles.caption1),
              ],
            ),
            Container(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$value", style: AppStyles.subtitle1),
                  Container(height: 5),
                  Text("ID: $resourceId", style: AppStyles.body1),
                  Container(height: 5),
                  Text("Updated: $updatedAt", style: AppStyles.caption1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
