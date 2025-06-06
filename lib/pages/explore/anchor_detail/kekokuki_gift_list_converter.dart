import 'dart:convert';
import 'package:floor/floor.dart';

import 'kekokuk_anchor_model.dart';

class KekokukiGiftListConverter extends TypeConverter<List<KekokukAnchorGiftModel>, String> {
  @override
  List<KekokukAnchorGiftModel> decode(String databaseValue) {
    return (jsonDecode(databaseValue) as List<dynamic>?)?.map((e) => KekokukAnchorGiftModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];
  }

  @override
  String encode(List<KekokukAnchorGiftModel> value) {
    return jsonEncode(value);
  }
}
