import 'dart:convert';
import 'package:floor/floor.dart';

import 'kekokuk_anchor_model.dart';

class KekokukiAlbumListConverter extends TypeConverter<List<KekokukAnchorAlbumModel>, String> {
  @override
  List<KekokukAnchorAlbumModel> decode(String databaseValue) {
    return (jsonDecode(databaseValue) as List<dynamic>?)?.map((e) => KekokukAnchorAlbumModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];
  }

  @override
  String encode(List<KekokukAnchorAlbumModel> value) {
    return jsonEncode(value);
  }
}
