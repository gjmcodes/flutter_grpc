///
//  Generated code. Do not modify.
//  source: person.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'person.pb.dart' as $0;
export 'person.pb.dart';

class PersonClient extends $grpc.Client {
  static final _$getPersonDetail =
      $grpc.ClientMethod<$0.GetPersonMessage, $0.PersonDetail>(
          '/person.Person/GetPersonDetail',
          ($0.GetPersonMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.PersonDetail.fromBuffer(value));

  PersonClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.PersonDetail> getPersonDetail(
      $0.GetPersonMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPersonDetail, request, options: options);
  }
}

abstract class PersonServiceBase extends $grpc.Service {
  $core.String get $name => 'person.Person';

  PersonServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetPersonMessage, $0.PersonDetail>(
        'GetPersonDetail',
        getPersonDetail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPersonMessage.fromBuffer(value),
        ($0.PersonDetail value) => value.writeToBuffer()));
  }

  $async.Future<$0.PersonDetail> getPersonDetail_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetPersonMessage> request) async {
    return getPersonDetail(call, await request);
  }

  $async.Future<$0.PersonDetail> getPersonDetail(
      $grpc.ServiceCall call, $0.GetPersonMessage request);
}
