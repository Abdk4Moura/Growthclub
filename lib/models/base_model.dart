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

abstract class Logger {
  Logger();

  String? id;

  Map<String, dynamic>? toFirestore();

  CollectionReference? _group;

  bool get _withRandomId;

  String? get _generatedId;

  void log({bool isUpdating = false}) {
    var toF = toFirestore();
    if (isUpdating) {
      assert(id != null);
      assert(toF != null);
      _group?.doc(id).update(toF!);
    } else {
      if (!_withRandomId) {
        String id_ =
            _generatedId!; /* generatedId has a side effect,
        it updates `id` itself */
        _group!.doc(id_).set(toF);
      } else {
        _group!.add(toF).then((value) {
          id = value.id;
        });
      }
    }
  }
}

abstract class DBObject extends Logger {
  DBObject();

  bool get fromClient => id == null;
}

abstract class SyncObject extends DBObject {
  SyncObject();

  late final Iterable<CollectionReference> syncContext;

  Future<void> sync();
}
