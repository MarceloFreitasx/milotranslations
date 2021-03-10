import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:milotranslations/core/models/resources.model.dart';

class MockData {
  _loadData() async {
    final _data = jsonDecode(await rootBundle.loadString("test/mock/data/resources.json"));
    return List<ResourcesModel>.from(_data.map((x) => ResourcesModel.fromJson(x)));
  }

  getData() async {
    return await _loadData();
  }
}
