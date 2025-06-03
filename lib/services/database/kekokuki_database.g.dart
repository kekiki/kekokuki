// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $KekokukiDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $KekokukiDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $KekokukiDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<KekokukiDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorKekokukiDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $KekokukiDatabaseBuilderContract databaseBuilder(String name) =>
      _$KekokukiDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $KekokukiDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$KekokukiDatabaseBuilder(null);
}

class _$KekokukiDatabaseBuilder implements $KekokukiDatabaseBuilderContract {
  _$KekokukiDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $KekokukiDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $KekokukiDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<KekokukiDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$KekokukiDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$KekokukiDatabase extends KekokukiDatabase {
  _$KekokukiDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  KekokukiChatConversationDao? _chatConversationDaoInstance;

  KekokukiChatMessageDao? _chatMessageDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `database_table_chat_conversation` (`anchorId` INTEGER NOT NULL, `portrait` TEXT NOT NULL, `nickname` TEXT NOT NULL, `summary` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `unreadCount` INTEGER NOT NULL, `orderBy` INTEGER NOT NULL, `isPined` INTEGER NOT NULL, `isNoDisturb` INTEGER NOT NULL, PRIMARY KEY (`anchorId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `database_table_chat_message` (`id` TEXT NOT NULL, `anchorId` INTEGER NOT NULL, `portrait` TEXT NOT NULL, `nickname` TEXT NOT NULL, `messageType` INTEGER NOT NULL, `status` INTEGER NOT NULL, `isSelfSent` INTEGER NOT NULL, `timestamp` INTEGER NOT NULL, `isShowTime` INTEGER NOT NULL, `jsonData` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  KekokukiChatConversationDao get chatConversationDao {
    return _chatConversationDaoInstance ??=
        _$KekokukiChatConversationDao(database, changeListener);
  }

  @override
  KekokukiChatMessageDao get chatMessageDao {
    return _chatMessageDaoInstance ??=
        _$KekokukiChatMessageDao(database, changeListener);
  }
}

class _$KekokukiChatConversationDao extends KekokukiChatConversationDao {
  _$KekokukiChatConversationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _kekokukiChatConversationModelInsertionAdapter = InsertionAdapter(
            database,
            'database_table_chat_conversation',
            (KekokukiChatConversationModel item) => <String, Object?>{
                  'anchorId': item.anchorId,
                  'portrait': item.portrait,
                  'nickname': item.nickname,
                  'summary': item.summary,
                  'timestamp': item.timestamp,
                  'unreadCount': item.unreadCount,
                  'orderBy': item.orderBy,
                  'isPined': item.isPined ? 1 : 0,
                  'isNoDisturb': item.isNoDisturb ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<KekokukiChatConversationModel>
      _kekokukiChatConversationModelInsertionAdapter;

  @override
  Stream<List<KekokukiChatConversationModel>?> selectConversationListStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM database_table_chat_conversation ORDER BY orderBy DESC,isPined DESC,timestamp DESC',
        mapper: (Map<String, Object?> row) => KekokukiChatConversationModel(
            anchorId: row['anchorId'] as int,
            summary: row['summary'] as String,
            timestamp: row['timestamp'] as int,
            portrait: row['portrait'] as String,
            nickname: row['nickname'] as String,
            unreadCount: row['unreadCount'] as int,
            orderBy: row['orderBy'] as int,
            isPined: (row['isPined'] as int) != 0,
            isNoDisturb: (row['isNoDisturb'] as int) != 0),
        queryableName: 'database_table_chat_conversation',
        isView: false);
  }

  @override
  Future<KekokukiChatConversationModel?> selectConversationWithAnchorId(
      int anchorId) async {
    return _queryAdapter.query(
        'SELECT * FROM database_table_chat_conversation WHERE anchorId = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => KekokukiChatConversationModel(anchorId: row['anchorId'] as int, summary: row['summary'] as String, timestamp: row['timestamp'] as int, portrait: row['portrait'] as String, nickname: row['nickname'] as String, unreadCount: row['unreadCount'] as int, orderBy: row['orderBy'] as int, isPined: (row['isPined'] as int) != 0, isNoDisturb: (row['isNoDisturb'] as int) != 0),
        arguments: [anchorId]);
  }

  @override
  Stream<int?> selectAllConversationUnreadCountStream() {
    return _queryAdapter.queryStream(
        'SELECT sum(unreadCount) FROM database_table_chat_conversation',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        queryableName: 'database_table_chat_conversation',
        isView: false);
  }

  @override
  Future<void> clearConversationUnreadCount(int anchorId) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE database_table_chat_conversation SET unreadCount = 0 WHERE anchorId = ?1',
        arguments: [anchorId]);
  }

  @override
  Future<void> clearAllUnreadCount() async {
    await _queryAdapter.queryNoReturn(
        'UPDATE database_table_chat_conversation SET unreadCount = 0');
  }

  @override
  Future<void> deleteConversationWithAnchorId(int anchorId) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM database_table_chat_conversation WHERE anchorId = ?1',
        arguments: [anchorId]);
  }

  @override
  Future<void> clear() async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM database_table_chat_conversation');
  }

  @override
  Future<void> insert(KekokukiChatConversationModel conversation) async {
    await _kekokukiChatConversationModelInsertionAdapter.insert(
        conversation, OnConflictStrategy.replace);
  }
}

class _$KekokukiChatMessageDao extends KekokukiChatMessageDao {
  _$KekokukiChatMessageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _kekokukiChatMessageModelInsertionAdapter = InsertionAdapter(
            database,
            'database_table_chat_message',
            (KekokukiChatMessageModel item) => <String, Object?>{
                  'id': item.id,
                  'anchorId': item.anchorId,
                  'portrait': item.portrait,
                  'nickname': item.nickname,
                  'messageType': item.messageType.index,
                  'status': item.status.index,
                  'isSelfSent': item.isSelfSent ? 1 : 0,
                  'timestamp': item.timestamp,
                  'isShowTime': item.isShowTime ? 1 : 0,
                  'jsonData': item.jsonData
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<KekokukiChatMessageModel>
      _kekokukiChatMessageModelInsertionAdapter;

  @override
  Stream<List<KekokukiChatMessageModel>?> selectMessagesWithAnchorIdStream(
      int anchorId) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM database_table_chat_message WHERE anchorId = ?1',
        mapper: (Map<String, Object?> row) => KekokukiChatMessageModel(
            id: row['id'] as String,
            messageType: KekokukiMessageType.values[row['messageType'] as int],
            status: KekokukiMessageStatus.values[row['status'] as int],
            isSelfSent: (row['isSelfSent'] as int) != 0,
            timestamp: row['timestamp'] as int,
            anchorId: row['anchorId'] as int,
            portrait: row['portrait'] as String,
            nickname: row['nickname'] as String,
            isShowTime: (row['isShowTime'] as int) != 0,
            jsonData: row['jsonData'] as String),
        arguments: [anchorId],
        queryableName: 'database_table_chat_message',
        isView: false);
  }

  @override
  Future<void> deleteMessagesWithId(String id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM database_table_chat_message WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> deleteMessagesWithAnchorId(int anchorId) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM database_table_chat_message WHERE anchorId = ?1',
        arguments: [anchorId]);
  }

  @override
  Future<void> clear() async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM database_table_chat_message');
  }

  @override
  Future<void> insert(KekokukiChatMessageModel message) async {
    await _kekokukiChatMessageModelInsertionAdapter.insert(
        message, OnConflictStrategy.replace);
  }
}
