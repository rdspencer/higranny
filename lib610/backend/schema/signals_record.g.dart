// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignalsRecord> _$signalsRecordSerializer =
    new _$SignalsRecordSerializer();

class _$SignalsRecordSerializer implements StructuredSerializer<SignalsRecord> {
  @override
  final Iterable<Type> types = const [SignalsRecord, _$SignalsRecord];
  @override
  final String wireName = 'SignalsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SignalsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.room;
    if (value != null) {
      result
        ..add('room')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  SignalsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignalsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'room':
          result.room = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$SignalsRecord extends SignalsRecord {
  @override
  final String room;
  @override
  final String message;
  @override
  final DocumentReference<Object> reference;

  factory _$SignalsRecord([void Function(SignalsRecordBuilder) updates]) =>
      (new SignalsRecordBuilder()..update(updates)).build();

  _$SignalsRecord._({this.room, this.message, this.reference}) : super._();

  @override
  SignalsRecord rebuild(void Function(SignalsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignalsRecordBuilder toBuilder() => new SignalsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignalsRecord &&
        room == other.room &&
        message == other.message &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, room.hashCode), message.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignalsRecord')
          ..add('room', room)
          ..add('message', message)
          ..add('reference', reference))
        .toString();
  }
}

class SignalsRecordBuilder
    implements Builder<SignalsRecord, SignalsRecordBuilder> {
  _$SignalsRecord _$v;

  String _room;
  String get room => _$this._room;
  set room(String room) => _$this._room = room;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SignalsRecordBuilder() {
    SignalsRecord._initializeBuilder(this);
  }

  SignalsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _room = $v.room;
      _message = $v.message;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignalsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignalsRecord;
  }

  @override
  void update(void Function(SignalsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignalsRecord build() {
    final _$result = _$v ??
        new _$SignalsRecord._(
            room: room, message: message, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
