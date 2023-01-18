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

class SemanticUpdateContradictionError extends Error {
  final String message;

  SemanticUpdateContradictionError(this.message);

  @override
  String toString() => "Attempt to update a non-existent record: $message";
}

abstract class DBObject {
  DBObject();

  String? id;

  bool get fromClient => id == null;

  Map<String, dynamic>? toFirestore();

  bool get _withRandomId => true;

  String? get _generatedId;
}

abstract class Logger extends DBObject {
  Logger();

  late CollectionReference _group;

  // TODO: make log more useful since dart values scope of method over
  // usability
  void log({bool isUpdating = false}) {
    var toF = toFirestore();
    if (isUpdating) {
      assert(id != null);
      assert(toF != null);
      _group.doc(id).update(toF!);
    } else {
      if (!_withRandomId) {
        String id_ =
            _generatedId!; /* generatedId has a side effect,
        it updates `id` itself */
        _group.doc(id_).set(toF);
      } else {
        _group.add(toF).then((value) {
          id = value.id;
        });
      }
    }
  }
}

abstract class SyncObject extends DBObject {
  SyncObject();

  late final Iterable<CollectionReference> syncContext;

  Future<void> sync();
}
