import 'package:uuid/uuid.dart';

String nextID() {
  return const Uuid().v4();
}
