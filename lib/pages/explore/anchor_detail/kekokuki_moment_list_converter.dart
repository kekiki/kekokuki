import 'dart:convert';
import 'package:floor/floor.dart';

import 'kekokuk_anchor_model.dart';

class KekokukiMomentListConverter extends TypeConverter<List<KekokukAnchorMomentModel>, String> {
  @override
  List<KekokukAnchorMomentModel> decode(String databaseValue) {
    return (jsonDecode(databaseValue) as List<dynamic>?)?.map((e) => KekokukAnchorMomentModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];
  }

  @override
  String encode(List<KekokukAnchorMomentModel> value) {
    return jsonEncode(value);
  }
}
