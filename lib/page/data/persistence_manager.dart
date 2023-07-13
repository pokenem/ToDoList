import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PersistenceManager {
  Future<Database> openDatabase() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final dbPath = '${appDir.path}/my_tasks.db';
      final database = await databaseFactoryIo.openDatabase(dbPath);
      return database;
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  Future<StoreRef<String, Map<String, dynamic>>> getStoreRef(
      Database database) {
    try
    {
    final store = stringMapStoreFactory.store('data');
    return Future.value(store);
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> getDataPersistence() async {
    try{
    final database = await openDatabase();
    final store = await getStoreRef(database);
    final records = await store.find(database);

    List<Map<String, dynamic>> dataPersistence = [];
    for (var record in records) {
      dataPersistence.add(record.value);
    }

    await database.close();

    return dataPersistence;
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  Future<void> putDataPersistence(Map<String, dynamic> tile) async {
    try{
    final database = await openDatabase();
    final store = await getStoreRef(database);

    await store.record(tile['id']).put(database, tile);

    await database.close();
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  Future<void> postDataPersistence(Map<String, dynamic> tile) async {
    try{
    final database = await openDatabase();
    final store = await getStoreRef(database);
    await store.record(tile['id']).add(database, tile);
    await database.close();
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  Future<void> deleteDataPersistence(Map<String, dynamic> tile) async {
    try{
    final database = await openDatabase();
    final store = await getStoreRef(database);
    await store.delete(database,
        finder: Finder(filter: Filter.byKey(tile['id'])));
    await database.close();
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  Future<void> patchDataPersistence(List<dynamic> list) async {
    try{
    final database = await openDatabase();
    final store = await getStoreRef(database);

    await store.delete(database);

    for (var item in list) {
      await store.record(item['id']).add(database, item.toMapPersistence());
    }

    await database.close();
    }
    catch(e)
    {
      throw Exception(e);
    }
  }
}
