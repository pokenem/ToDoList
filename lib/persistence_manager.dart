import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tdlist/network_methods.dart';
import 'package:tdlist/page/home_page.dart';

import 'network_manager.dart';

var networkManager = NetworkManager();

class PersistenceManager {
  Future<File> get _file async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File("${appDir.path}/list.txt");
    if (!await file.exists()) {
      await file.create();
    }
    return file;
  }

  Future<List<dynamic>> getDataPersistence() async {
    final file = await _file;

    try {
      await networkManager.getData();
      final jsonString = await file.readAsString();

      List<dynamic> jsonData = [];
      if(jsonString != '') {
        jsonData = jsonDecode(jsonString);
      }

      List<Map<String, dynamic>> dataPersistence = [];
      for(var item in jsonData)
      {
        dataPersistence.add(jsonDecode(item)['element']);
      }
      changeListNetwork(dataPersistence);
      //final jsonData = jsonEncode(networkData);
     // await file.writeAsString(jsonData, mode: FileMode.write);

      return dataPersistence;
    } catch (e) {
      logger.w('Failed to fetch data from network: $e');
    }

    if (await file.exists()) {
      final jsonString = await file.readAsString();
      List<dynamic> jsonData = [];
      if(jsonString != '') {
        jsonData = jsonDecode(jsonString);
      }

      List<Map<String, dynamic>> dataPersistence = [];
      for(var item in jsonData)
        {
            dataPersistence.add(jsonDecode(item)['element']);
        }
      return dataPersistence;
    } else {
      return [];
    }
  }

  Future<void> patchDataPersistence(List<dynamic> list) async {
    final file = await _file;
    final jsonData = jsonEncode(list);
    await file.writeAsString(jsonData, mode: FileMode.write);
  }
}
