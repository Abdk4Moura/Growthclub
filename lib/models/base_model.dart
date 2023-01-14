import 'package:cloud_firestore/cloud_firestore.dart';

String checksum(String string) {
  // TODO: Implement checksum computation of strings
  throw UnimplementedError('Unimplemented checksum function');
  return '';
}

class SetFunctionError extends Error {
  final String message;

  SetFunctionError(this.message);

  @override
  String toString() => "Should not/Cannot implement setter for $message";
}

abstract class Logger {
  const Logger(
      {this.id, this.fromClient = true, this.group, this.withRandomId = true});

  final String? id;
  final bool fromClient;

  Map<String, dynamic>? toFirestore();

  final CollectionReference? group;
  final bool withRandomId;

  String? get generatedId;

  log([bool update = false]) {
    if (fromClient) {
      return;
    }
    var toF = toFirestore();
    if (!update) {
      if (!withRandomId) {
        String id_ = generatedId as String;
        group!.doc(id_).set(toF);
      } else {
        group!.add(toF);
      }
      return;
    }

    group?.doc(id).update(toF as Map<String, dynamic>);
  }
}

abstract class DBObject extends Logger {
  const DBObject(
      {super.id, this.fromClient = false, super.group, super.withRandomId});

  @override
  final bool fromClient;
}

abstract class SyncObject extends DBObject {
  SyncObject({super.id, super.fromClient, super.group, super.withRandomId});

  late Iterable<CollectionReference> syncContext;

  Future<void> sync();
}
