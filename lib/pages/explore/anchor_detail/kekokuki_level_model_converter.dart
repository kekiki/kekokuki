import 'dart:convert';
import 'package:floor/floor.dart';

import 'kekokuk_anchor_model.dart';

class KekokukiLevelModelConverter extends TypeConverter<KekokukAnchorLevelModel, String> {
  @override
  KekokukAnchorLevelModel decode(String databaseValue) {
    return KekokukAnchorLevelModel.fromJson(jsonDecode(databaseValue));
  }

  @override
  String encode(KekokukAnchorLevelModel value) {
    return jsonEncode(value.toJson());
  }
}
