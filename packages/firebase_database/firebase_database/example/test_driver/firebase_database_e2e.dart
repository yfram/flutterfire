// ignore_for_file: require_trailing_commas

import 'package:drive/drive.dart' as drive;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_test/flutter_test.dart';

import 'data_snapshot_e2e.dart';
import 'database_e2e.dart';
import 'database_reference_e2e.dart';
import './utils/extensions.dart';
import 'firebase_database_configuration_e2e.dart';
import 'query_e2e.dart';

late FirebaseDatabase database;

void testsMain() {
  setUpAll(() async {
    await Firebase.initializeApp();
    database = FirebaseDatabase.instance;
  });

  group('query', () {
    test('orderByChild()', () async {
      try {
        final s = await database.ref('ordered').orderByChild('value').get();
        expect(s.keys, ['three', 'one', 'four', 'two']);
      } catch (e) {
        print((e as dynamic).message);
        rethrow;
      }
    });
  });

  // runConfigurationTests();
  // runDatabaseTests();
  // runDatabaseReferenceTests();
  // runQueryTests();
  // runDataSnapshotTests();
}

void main() => drive.main(testsMain);
