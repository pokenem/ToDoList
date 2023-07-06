import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sembast/sembast.dart';
import 'package:tdlist/page/data/persistence_manager.dart';

class MockDatabase extends Mock implements Database {}

class MockStoreRef extends Mock
    implements StoreRef<String, Map<String, dynamic>> {}

void main() {
  group('PersistenceManager', () {
    late MockDatabase mockDatabase;
    late MockStoreRef mockStoreRef;
    late PersistenceManager persistenceManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    setUp(() {
      persistenceManager = PersistenceManager();
      mockDatabase = MockDatabase();
      mockStoreRef = MockStoreRef();
    });

    test('getDataPersistence should return a list of maps', () async {
      when(persistenceManager.openDatabase())
          .thenAnswer((_) => Future.value(mockDatabase));

      when(persistenceManager.getStoreRef(mockDatabase))
          .thenAnswer((_) => Future.value(mockStoreRef));

      // final mockRecords = [
      //   { 'text': 'Late',
      //     'id': '1232',
      //     'done': true,
      //     'changed_at': 234213421,
      //     'created_at': 13241343,
      //     'color': '#FFFFFFF',
      //     'last_updated_by': 'dora',
      //     'importance': 'low',},
      //   { 'text': 'Dude',
      //     'id': '1234244232',
      //     'done': true,
      //     'changed_at': 234213421,
      //     'created_at': 13241343,
      //     'color': '#FFFFFFF',
      //     'last_updated_by': 'dora',
      //     'importance': 'low',}
      // ];

      //  when(mockStoreRef.find(any)).thenAnswer((_) => Future.value(mockRecords));

      final dataPersistence = await persistenceManager.getDataPersistence();
      expect(dataPersistence, isA<List<Map<String, dynamic>>>());
    });

    test('putDataPersistence should store data in the database', () async {
      final tile = {
        'text': 'LateIn',
        'id': '1232',
        'done': true,
        'changed_at': 234213421,
        'created_at': 13241343,
        'color': '#FFFFFFF',
        'last_updated_by': 'dora',
        'importance': 'low',
      };
      await persistenceManager.putDataPersistence(tile);
      final dataPersistence = await persistenceManager.getDataPersistence();
      expect(dataPersistence, contains(tile));
    });

    test('postDataPersistence should add data to the database', () async {
      final tile = {
        'text': 'Lego',
        'id': '123244',
        'done': true,
        'changed_at': 234213421,
        'created_at': 13241343,
        'color': '#FFFFFFF',
        'last_updated_by': 'dora',
        'importance': 'high',
      };
      await persistenceManager.postDataPersistence(tile);
      final dataPersistence = await persistenceManager.getDataPersistence();
      expect(dataPersistence, contains(tile));
    });

    test('deleteDataPersistence should remove data from the database',
        () async {
      final tile = {
        'text': 'Late',
        'id': '1232',
        'done': true,
        'changed_at': 234213421,
        'created_at': 13241343,
        'color': '#FFFFFFF',
        'last_updated_by': 'dora',
        'importance': 'low',
      };
      await persistenceManager.deleteDataPersistence(tile);
      final dataPersistence = await persistenceManager.getDataPersistence();
      expect(dataPersistence, isNot(contains(tile)));
    });

    test('patchDataPersistence should replace data in the database', () async {
      final initialData = [
        {
          'text': 'Hi',
          'id': '1232',
          'done': true,
          'changed_at': 234213421,
          'created_at': 13241343,
          'color': '#FFFFFFF',
          'last_updated_by': 'dora',
          'importance': 'low',
        },
        {
          'text': 'go',
          'id': '123232131',
          'done': true,
          'changed_at': 234213421,
          'created_at': 13241343,
          'color': '#FFFFFFF',
          'last_updated_by': 'dora',
          'importance': 'high',
        }
      ];
      final updatedData = [
        {
          'text': 'Dora',
          'id': '123232424242',
          'done': true,
          'changed_at': 234213421,
          'created_at': 13241343,
          'color': '#FFFFFFF',
          'last_updated_by': 'dora',
          'importance': 'low',
        },
        {
          'text': 'Bora',
          'id': '12354353432',
          'done': true,
          'changed_at': 234213421,
          'created_at': 13241343,
          'color': '#FFFFFFF',
          'last_updated_by': 'dora',
          'importance': 'low',
        }
      ];
      await persistenceManager.patchDataPersistence(updatedData);
      final dataPersistence = await persistenceManager.getDataPersistence();
      expect(dataPersistence, equals(updatedData));
      expect(dataPersistence, isNot(equals(initialData)));
    });
  });
}
