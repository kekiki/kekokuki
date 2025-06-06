import 'package:floor/floor.dart';

import '../../pages/explore/anchor_detail/kekokuk_anchor_model.dart';

@dao
abstract class KekokukiAnchorDao {
  static const _tableName = KekokukiAnchorModel.tableName;

  @Query('SELECT * FROM $_tableName WHERE id=:id')
  Future<KekokukiAnchorModel?> findAnchorById(int id);

  @Query('SELECT * FROM $_tableName WHERE id=:id')
  Stream<KekokukiAnchorModel?> findAnchorByIdAsStream(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAnchor(KekokukiAnchorModel anchorInfo);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAnchorList(List<KekokukiAnchorModel> anchorList);

  @delete
  Future<void> deleteAnchor(KekokukiAnchorModel anchorInfo);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateAnchor(KekokukiAnchorModel anchorInfo);

  @Query('DELETE FROM $_tableName')
  Future<void> clear();
}
