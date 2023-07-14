// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseRedis {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseRedisBuilder databaseBuilder(String name) =>
      _$DatabaseRedisBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseRedisBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseRedisBuilder(null);
}

class _$DatabaseRedisBuilder {
  _$DatabaseRedisBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseRedisBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseRedisBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseRedis> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseRedis();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseRedis extends DatabaseRedis {
  _$DatabaseRedis([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SleepDataDao? _sleepDataDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `SleepData` (`date` TEXT NOT NULL, `duration` REAL NOT NULL, `efficiency` INTEGER, `deep` INTEGER, `rem` INTEGER, `wake` INTEGER, `quiz` REAL, PRIMARY KEY (`date`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SleepDataDao get sleepDataDao {
    return _sleepDataDaoInstance ??= _$SleepDataDao(database, changeListener);
  }
}

class _$SleepDataDao extends SleepDataDao {
  _$SleepDataDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _sleepDataInsertionAdapter = InsertionAdapter(
            database,
            'SleepData',
            (SleepData item) => <String, Object?>{
                  'date': item.date,
                  'duration': item.duration,
                  'efficiency': item.efficiency,
                  'deep': item.deep,
                  'rem': item.rem,
                  'wake': item.wake,
                  'quiz': item.quiz
                }),
        _sleepDataUpdateAdapter = UpdateAdapter(
            database,
            'SleepData',
            ['date'],
            (SleepData item) => <String, Object?>{
                  'date': item.date,
                  'duration': item.duration,
                  'efficiency': item.efficiency,
                  'deep': item.deep,
                  'rem': item.rem,
                  'wake': item.wake,
                  'quiz': item.quiz
                }),
        _sleepDataDeletionAdapter = DeletionAdapter(
            database,
            'SleepData',
            ['date'],
            (SleepData item) => <String, Object?>{
                  'date': item.date,
                  'duration': item.duration,
                  'efficiency': item.efficiency,
                  'deep': item.deep,
                  'rem': item.rem,
                  'wake': item.wake,
                  'quiz': item.quiz
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SleepData> _sleepDataInsertionAdapter;

  final UpdateAdapter<SleepData> _sleepDataUpdateAdapter;

  final DeletionAdapter<SleepData> _sleepDataDeletionAdapter;

  @override
  Future<List<double>> findAllDuration() async {
    return _queryAdapter.queryList('SELECT duration FROM SleepData',
        mapper: (Map<String, Object?> row) => row.values.first as double);
  }

  @override
  Future<List<int>> findAllEfficiency() async {
    return _queryAdapter.queryList('SELECT efficiency FROM SleepData',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<int>> findAllDeep() async {
    return _queryAdapter.queryList('SELECT deep FROM SleepData',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<int>> findAllRem() async {
    return _queryAdapter.queryList('SELECT rem FROM SleepData',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<int>> findAllWake() async {
    return _queryAdapter.queryList('SELECT wake FROM SleepData',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<double>> findAllQuiz() async {
    return _queryAdapter.queryList('SELECT quiz FROM SleepData',
        mapper: (Map<String, Object?> row) => row.values.first as double);
  }

  @override
  Future<List<SleepData?>> findAllDayData(String day) async {
    return _queryAdapter.queryList('SELECT * FROM SleepData WHERE date = ?1',
        mapper: (Map<String, Object?> row) => SleepData(
            row['date'] as String,
            row['duration'] as double,
            row['efficiency'] as int?,
            row['deep'] as int?,
            row['rem'] as int?,
            row['wake'] as int?,
            row['quiz'] as double?),
        arguments: [day]);
  }

  @override
  Future<void> updateQuizScoreByDate(
    double score,
    String day,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE SleepData SET quiz = ?1 WHERE date = ?2',
        arguments: [score, day]);
  }

  @override
  Future<void> insertSleepData(SleepData sleepData) async {
    await _sleepDataInsertionAdapter.insert(
        sleepData, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSleepData(SleepData sleepData) async {
    await _sleepDataUpdateAdapter.update(sleepData, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSleepData(SleepData sleepData) async {
    await _sleepDataDeletionAdapter.delete(sleepData);
  }
}
