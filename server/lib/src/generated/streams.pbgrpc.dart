///
//  Generated code. Do not modify.
//  source: streams.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'streams.pb.dart' as $0;
export 'streams.pb.dart';

class StreamsClient extends $grpc.Client {
  static final _$getServerStreams =
      $grpc.ClientMethod<$0.StreamMessageRequest, $0.StreamMessageResponse>(
          '/streams.Streams/GetServerStreams',
          ($0.StreamMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StreamMessageResponse.fromBuffer(value));
  static final _$sendServerStreams =
      $grpc.ClientMethod<$0.StreamMessageRequest, $0.StreamMessageResponse>(
          '/streams.Streams/SendServerStreams',
          ($0.StreamMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StreamMessageResponse.fromBuffer(value));

  StreamsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.StreamMessageResponse> getServerStreams(
      $0.StreamMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getServerStreams, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.StreamMessageResponse> sendServerStreams(
      $async.Stream<$0.StreamMessageRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sendServerStreams, request, options: options)
        .single;
  }
}

abstract class StreamsServiceBase extends $grpc.Service {
  $core.String get $name => 'streams.Streams';

  StreamsServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.StreamMessageRequest, $0.StreamMessageResponse>(
            'GetServerStreams',
            getServerStreams_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.StreamMessageRequest.fromBuffer(value),
            ($0.StreamMessageResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StreamMessageRequest, $0.StreamMessageResponse>(
            'SendServerStreams',
            sendServerStreams,
            true,
            false,
            ($core.List<$core.int> value) =>
                $0.StreamMessageRequest.fromBuffer(value),
            ($0.StreamMessageResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.StreamMessageResponse> getServerStreams_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.StreamMessageRequest> request) async* {
    yield* getServerStreams(call, await request);
  }

  $async.Stream<$0.StreamMessageResponse> getServerStreams(
      $grpc.ServiceCall call, $0.StreamMessageRequest request);
  $async.Future<$0.StreamMessageResponse> sendServerStreams(
      $grpc.ServiceCall call, $async.Stream<$0.StreamMessageRequest> request);
}
