///
//  Generated code. Do not modify.
//  source: person.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetPersonMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPersonMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'person'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'personId', protoName: 'personId')
    ..hasRequiredFields = false
  ;

  GetPersonMessage._() : super();
  factory GetPersonMessage({
    $core.String? personId,
  }) {
    final _result = create();
    if (personId != null) {
      _result.personId = personId;
    }
    return _result;
  }
  factory GetPersonMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPersonMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPersonMessage clone() => GetPersonMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPersonMessage copyWith(void Function(GetPersonMessage) updates) => super.copyWith((message) => updates(message as GetPersonMessage)) as GetPersonMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPersonMessage create() => GetPersonMessage._();
  GetPersonMessage createEmptyInstance() => create();
  static $pb.PbList<GetPersonMessage> createRepeated() => $pb.PbList<GetPersonMessage>();
  @$core.pragma('dart2js:noInline')
  static GetPersonMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPersonMessage>(create);
  static GetPersonMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get personId => $_getSZ(0);
  @$pb.TagNumber(1)
  set personId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonId() => clearField(1);
}

class PersonDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PersonDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'person'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  PersonDetail._() : super();
  factory PersonDetail({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory PersonDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PersonDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PersonDetail clone() => PersonDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PersonDetail copyWith(void Function(PersonDetail) updates) => super.copyWith((message) => updates(message as PersonDetail)) as PersonDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PersonDetail create() => PersonDetail._();
  PersonDetail createEmptyInstance() => create();
  static $pb.PbList<PersonDetail> createRepeated() => $pb.PbList<PersonDetail>();
  @$core.pragma('dart2js:noInline')
  static PersonDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PersonDetail>(create);
  static PersonDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

