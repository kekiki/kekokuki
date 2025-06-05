import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/utils/kekokuki_log_util.dart';
// import 'package:sqflite/sqflite.dart' as sqflite;

import 'kekokuki_database.dart';

class KekokukiDatabaseService extends GetxService {
  static const _tag = 'DatabaseService';
  Future<KekokukiDatabase> init() async {
    final database = await $FloorKekokukiDatabase
        .databaseBuilder('database.db')
        .addMigrations(
          [
            // 版本升级处理
            // Migration(1, 2, (database) async {
            //   await migration1to2(database);
            // }),
          ],
        )
        .addCallback(Callback(
          onOpen: (database) {
            KekokukiLogUtil.i(_tag, 'Dadabase onOpen: ${database.toString()}');
          },
          onCreate: (database, version) {
            KekokukiLogUtil.i(_tag, 'Dadabase onCreate, version: $version');
          },
        ))
        .build();
    return database;
  }

  // Future<void> migration1to2(sqflite.Database database) async {
  //   await database.execute('DROP TABLE IF EXISTS `tbProductInfo`');
  //   await database.execute(
  //       'CREATE TABLE IF NOT EXISTS `tbProductInfo` (`appId` INTEGER NOT NULL, `coins` INTEGER NOT NULL, `discount` REAL NOT NULL, `price` REAL NOT NULL, `productId` TEXT NOT NULL, `rewardCoins` INTEGER NOT NULL, `status` INTEGER NOT NULL, `title` TEXT NOT NULL, `type` INTEGER NOT NULL, `priceText` TEXT NOT NULL, `mostSelected` TEXT NOT NULL, `currency` TEXT NOT NULL, `rewardDurationCard` INTEGER NOT NULL, PRIMARY KEY (`productId`))');
  // }
}
