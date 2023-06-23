import 'package:path_provider/path_provider.dart';
import 'package:tdlist/network/network_methods.dart';
import 'package:tdlist/page/home_page.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../network/network_manager.dart';

var networkManager = NetworkManager();

class PersistenceManager {
  Future<Database> _openDatabase() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = '${appDir.path}/my_tasks.db';
    final database = await databaseFactoryIo.openDatabase(dbPath);
    return database;
  }

  Future<StoreRef<String, Map<String, dynamic>>> _getStoreRef(Database database) {
    final store = stringMapStoreFactory.store('data');
    return Future.value(store);
  }

  Future<List<dynamic>> getDataPersistence() async {
    try {
      await networkManager.getData();
    } catch (e) {
      logger.w('Failed to fetch data from network: $e');
    }

    final database = await _openDatabase();
    final store = await _getStoreRef(database);
    final records = await store.find(database);

    List<Map<String, dynamic>> dataPersistence = [];
    for (var record in records) {
      dataPersistence.add(record.value);
    }

    changeListNetwork(dataPersistence);
    await database.close();

    return dataPersistence;
  }

  Future<void> putDataPersistence(Map<String, dynamic> tile) async {
    final database = await _openDatabase();
    final store = await _getStoreRef(database);

    await store.record(tile['id']).put(database, tile);

    await database.close();
  }

  Future<void> postDataPersistence(Map<String, dynamic> tile) async {
    final database = await _openDatabase();
    final store = await _getStoreRef(database);
    await store.record(tile['id']).add(database, tile);
    await database.close();
  }

  Future<void> deleteDataPersistence(Map<String, dynamic> tile) async {
    final database = await _openDatabase();
    final store = await _getStoreRef(database);
    await store.delete(database, finder: Finder(filter: Filter.byKey(tile['id'])));
    await database.close();
  }

  Future<void> patchDataPersistence(List<dynamic> list) async {
    final database = await _openDatabase();
    final store = await _getStoreRef(database);

    await store.delete(database); // Clear existing data

    for (var item in list) {
      await store.record(item['id']).add(database, item.toMapPersistence());
    }

    await database.close();
  }
}
