import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'signals_record.g.dart';

abstract class SignalsRecord
    implements Built<SignalsRecord, SignalsRecordBuilder> {
  static Serializer<SignalsRecord> get serializer => _$signalsRecordSerializer;

  @nullable
  String get room;

  @nullable
  String get message;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SignalsRecordBuilder builder) => builder
    ..room = ''
    ..message = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('signals');

  static Stream<SignalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SignalsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SignalsRecord._();
  factory SignalsRecord([void Function(SignalsRecordBuilder) updates]) =
      _$SignalsRecord;

  static SignalsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSignalsRecordData({
  String room,
  String message,
}) =>
    serializers.toFirestore(
        SignalsRecord.serializer,
        SignalsRecord((s) => s
          ..room = room
          ..message = message));
