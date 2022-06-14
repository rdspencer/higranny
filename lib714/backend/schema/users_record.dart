import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  BuiltList<int> get favorites;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get role;

  @nullable
  String get room;

  @nullable
  @BuiltValueField(wireName: 'message_for_granny')
  String get messageForGranny;

  @nullable
  @BuiltValueField(wireName: 'granny_display_name')
  String get grannyDisplayName;

  @nullable
  @BuiltValueField(wireName: 'first_carers_email')
  String get firstCarersEmail;

  @nullable
  @BuiltValueField(wireName: 'ref_to_granny')
  DocumentReference get refToGranny;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..favorites = ListBuilder()
    ..phoneNumber = ''
    ..role = ''
    ..room = ''
    ..messageForGranny = ''
    ..grannyDisplayName = ''
    ..firstCarersEmail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String role,
  String room,
  String messageForGranny,
  String grannyDisplayName,
  String firstCarersEmail,
  DocumentReference refToGranny,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..favorites = null
          ..phoneNumber = phoneNumber
          ..role = role
          ..room = room
          ..messageForGranny = messageForGranny
          ..grannyDisplayName = grannyDisplayName
          ..firstCarersEmail = firstCarersEmail
          ..refToGranny = refToGranny));
